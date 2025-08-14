"
## Usage 
```
file := '/Path/To/.../JDIOutput.cs' asFileReference.
model := CallStackJsonReader import: file.
```
	
	

"
Class {
	#name : 'CallStackJsonReader',
	#superclass : 'Object',
	#instVars : [
		'filename',
		'model',
		'createdPrimitives',
		'createdClasses',
		'createdMethods',
		'createdReference'
	],
	#category : 'Famix-CallStack-Importer',
	#package : 'Famix-CallStack-Importer'
}

{ #category : 'api' }
CallStackJsonReader class >> import: aFileReference [

	^ self new readFrom: aFileReference
]

{ #category : 'class initialization' }
CallStackJsonReader class >> initialize [

	self registerExternalDropHandler
]

{ #category : 'class initialization' }
CallStackJsonReader class >> registerExternalDropHandler [
	ExternalDropHandler registerHandler: (ExternalDropHandler type: nil extension: #cs action: [ :fileReference |
				 (self import: fileReference)
					 install;
					 inspect ])
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArgument: aCollection [
	"Instiantiate an argument given to a method in a stackline"
	| arg |
	arg := model newArgument.
	aCollection ifNotNil: [ arg value: (self createValueWith: aCollection) ].
	^ arg
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArrayValueWith: aCollection [
	"Instantiate an ArrayValue"
	^ self fillValueCheckingMaxDepthOn: model newArrayValue with: aCollection.
]

{ #category : 'instance creation' }
CallStackJsonReader >> createClassNamed: aString [
	"Instantiate a FamixJavaClass with the given name"
	| name |
	name := aString removeSuffix: '[]'.
	^ createdClasses at: name ifAbsentPut: [
			  (model newClassNamed: name )
				  isStub: true;
				  yourself ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> createField: aDictionary [
	"Instantiate a field from a ClassReference"

	| field valueDict |
	field := model newField
		         name: (aDictionary at: #name);
		         yourself.

	"Default: accessible if not specified"
	field isAccessible: (aDictionary at: #accessible ifAbsent: [ true ]).


	"Since a field can be nil, it is imperative to check that aDictionary dont include the key value, and not use valueDict form below"
	(field isAccessible and: [ (aDictionary includesKey: #value) not ]) ifTrue: [ Error signal: 'Field has no value while being accessible' ].

	(field isAccessible not and: [ aDictionary includesKey: #value ]) ifTrue: [ Error signal: 'Field has a value while being inaccessible' ].

	valueDict := aDictionary at: #value ifAbsent: [ nil ].


	(field isAccessible and: [ valueDict notNil ]) ifTrue: [ self fillValueCheckingMaxDepthOn: field with: valueDict ].

	^ field
]

{ #category : 'instance creation' }
CallStackJsonReader >> createMethod: aDictionary [
	"Instantiate a FamixJavaMethod with all given informations"

	| paramTypeNames methodNameDict methodTypesDict |
	paramTypeNames := (aDictionary at: #parameters) collect: [ :param | param at: #type ].

	methodNameDict := createdMethods at: (aDictionary at: #name) ifAbsentPut: [ Dictionary new ].

	methodTypesDict := methodNameDict at: (aDictionary at: #parentType) ifAbsentPut: [ Dictionary new ].

	^ methodTypesDict at: paramTypeNames ifAbsentPut: [ self instantiateMethodFrom: aDictionary ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> createMethodCall: aDictionary [
	"Instatiate the MethodCall of a stack line, being the method informations and the given arguments"

	| methodCall argsDict argValuesDict |
	methodCall := model newMethodCall.
	methodCall method: (self createMethod: (aDictionary at: #method)).

	argsDict := aDictionary at: #arguments.
	"Default: accessible if not specified"
	methodCall isArgsAccessible: (argsDict at: #accessible ifAbsent: [ true ]).

	argValuesDict := argsDict at: #argsValues ifAbsent: [ nil ].
	(methodCall isArgsAccessible and: [ argValuesDict isNil ]) ifTrue: [
		Error signal: 'methodCall has no arguments description while arguments being accessible' ].

	(methodCall isArgsAccessible not and: [ argValuesDict notNil ]) ifTrue: [
		Error signal: 'methodCall has a arguments description while arguments being inaccessible' ].

	(methodCall isArgsAccessible and: [ argValuesDict notNil ]) ifTrue: [
		argValuesDict collect: [ :argDict | self createArgument: argDict ] thenDo: [ :arg | methodCall addArgument: arg ] ].
	^ methodCall
]

{ #category : 'instance creation' }
CallStackJsonReader >> createParameters: anArray [
	"Instantiates all parameters of a method"

	^ anArray collect: [ :param |
		  self createTypingFor: (model newParameterNamed: (param at: #name)) with: (self createClassNamed: (param at: #type)) ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> createPrimitiveType: aString [
	"Instantiate a PrimitiveType if not already on the model"
	| name |
	name := aString removeSuffix: '[]'.
	^ createdClasses at: name ifAbsentPut: [
			  (model newPrimitiveTypeNamed: name)
				  isStub: true;
				  yourself ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> createPrimitiveValue: aDictionary [
	"Instantiate a PrimitiveValue"

	| primVal |
	primVal := model newPrimitiveValue.
	self createTypingFor: primVal with: (self createPrimitiveType: (aDictionary at: #type)).
	primVal value: (aDictionary at: #value).
	^ primVal
]

{ #category : 'instance creation' }
CallStackJsonReader >> createReceiver: aDictionary [
	"Instantiate the receiver of in a stack line"

	^ model newReceiver value: (self createValueReference: (aDictionary at: #reference))
]

{ #category : 'instance creation' }
CallStackJsonReader >> createStackline: aDictionnary [
  	"Instantiate a line of a stack"
	| line |
	line := model newStackline.

	line methodCall: (self createMethodCall: aDictionnary).
	(aDictionnary at: #receiver) ifNotNil: [ :receiver | line receiver: (self createReceiver: receiver) ].
	^ line
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createTypingFor: anObject with: type [

	^ anObject
		  typing: (model newEntityTyping declaredType: type);
		  yourself
]

{ #category : 'instance creation' }
CallStackJsonReader >> createValueReference: aDictionary [
	"Instantiate a ValueReference"

	| reference type |
	aDictionary
		at: #alreadyFound
		ifPresent: [ :bool | "The only important case is if its true, because if its false or absent we need to create it either ways"
				bool ifTrue: [
						createdReference at: (aDictionary at: #uniqueId) ifPresent: [ :value | ^ value ] ifAbsent: [
								Error signal:
									'The objectReference with ID:' , (aDictionary at: #uniqueId) asString
									, ' is indicated to be already found, but is not in the saved references' ] ] ].
						
	reference := createdReference
		             at: (aDictionary at: #uniqueId)
		             ifPresent: [
			             Error signal:
				             'Trying to create an object with ID:' , (aDictionary at: #uniqueId) asString
				             , ' while an existing ObjectReference already has this ID' ]
		             ifAbsentPut: [ (self instantiateReferenceEntityFrom: aDictionary) uniqueID: (aDictionary at: #uniqueId) ].

	reference fillFrom: (aDictionary at: #refered) reader: self.

	"Here we asume that 
	- a class will be defined with its package in its name meaning containing at least a dot
	- while a primitive type wont have a package so no dots"
	type := ((aDictionary at: #type) includesSubstring: '.')
		        ifTrue: [ self createClassNamed: (aDictionary at: #type) ]
		        ifFalse: [ self createPrimitiveType: (aDictionary at: #type) ].
	self createTypingFor: reference with: type.

	^ reference
]

{ #category : 'instance creation' }
CallStackJsonReader >> createValueWith: aDictionnary [
	"Choose which subTypes of a Value should be instantiated"

	"Looking for either a reference or a primitive type, if neither are present throw an error"

	aDictionnary at: #reference ifPresent: [ :reference | ^ self createValueReference: reference ].
	aDictionnary at: #primitiveType ifPresent: [ :primitive | ^ self createPrimitiveValue: primitive ].
	Error signal: 'Unexcepted argument value'
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> fillValueCheckingMaxDepthOn: aCSObject with: aCollection [

	^ aCollection
		  ifNotNil: [
				  aCollection isString
					  ifTrue: [
							  (aCollection sameAs: '<<MAX_DEPTH_REACHED>>')
								  ifTrue: [ aCSObject isAtMaxDepth: true ]
								  ifFalse: [ Error signal: 'Uneccepted String in field import :' , aCollection ] ]
					  ifFalse: [ aCSObject value: (self createValueWith: aCollection) ] ]
		  ifNil: [ aCSObject ]
]

{ #category : 'initialization' }
CallStackJsonReader >> initialize [ 
	createdReference := Dictionary new.
	createdPrimitives := Dictionary new.
	createdClasses := Dictionary new.
	createdMethods := Dictionary new.
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> instantiateMethodFrom: aDictionnary [

	| method |
	method := (model newMethodNamed: (aDictionnary at: #name)) isStub: true.

	method isClassSide: (aDictionnary at: #isClassSide).
	method parentType: (self createClassNamed: (aDictionnary at: #parentType)).

	(self createParameters: (aDictionnary at: #parameters)) do: [ :param | method addParameter: param ].
	^ method
]

{ #category : 'accessing' }
CallStackJsonReader >> instantiateReferenceEntityFrom: aDictionary [

	| refered |
	refered := aDictionary at: #refered.
	refered isDictionary ifTrue: [
			refered at: #fields ifPresent: [ :fields | ^ model newClassReference ].
			refered at: #elements ifPresent: [ :elements | ^ model newArrayReference ] ].

	refered isString ifTrue: [
			refered isCSAttentionTag 
				ifFalse: [ ^ model newStringReference ]
				ifTrue: [
						(refered sameAs: '<<CLASS_NOT_PREPARED>>')
							ifTrue: [ ^ model newClassReference isPrepared: false; yourself]
							ifFalse: [ Error signal: 'Uneccepted attention tag in value reference importation : ' , refered ] ] ].
	Error signal: 'Should either be String or dictionary'
]

{ #category : 'accessing' }
CallStackJsonReader >> model [
	^ model
]

{ #category : 'accessing' }
CallStackJsonReader >> model: aModel [

	model := aModel
]

{ #category : 'instance creation' }
CallStackJsonReader >> read: json [
	"Instantiate the JavaCallStack model from a json object"

	| stack lines |
	json ifEmpty: [ Error signal: 'The json file is empty' ] ifNotEmpty: [
			model := FamixCSModel new
				         name: filename;
				         yourself.
			stack := model newStack.
			lines := json at: #Lines. "Get the lines"
			lines do: [ :line | stack addStackline: (self createStackline: line) ].
			model entities do: #resetMooseName ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> readFrom: aFileReference [
	"Read the file reference as a json file and start the import as a JavaCallStack model"

	| reader |
	filename := aFileReference basename.
	reader := NeoJSONReader on: aFileReference readStream.
	self read: reader next.
	reader close.

	^ model
]
