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
	aCollection ifNotNil: [
			aCollection isCSAttentionTag
				ifTrue: [ 1 halt.
						(aCollection sameAs: '<<INACCESSIBLE>>')
							ifTrue: [ arg accessible: false ]
							ifFalse: [ Error signal: 'unhandled attention tag : ' , aCollection ] ]
				ifFalse: [ arg value: (self createValueWith: aCollection) ] ].
	^ arg
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArrayReference: aCollection withId: uniqueId [
	"Instantiate an ArrayReference and all its values"

	| ref |
	ref := model newArrayReference.

	ref uniqueID: uniqueId.
	createdReference at: uniqueId put: ref.

	ref size: aCollection size.
	aCollection do: [ :elem | ref addElement: (self createArrayValueWith: elem) ].
	^ ref
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArrayValueWith: aCollection [
	"Instantiate an ArrayValue"

	| arrVal |
	arrVal := model newArrayValue.
	"if the collection (so the value) is nil then there is no need to add anything"
	aCollection ifNotNil: [
			aCollection isCSAttentionTag
				ifTrue: [
						(aCollection sameAs: '<<MAX_DEPTH_REACHED>>')
							ifTrue: [ arrVal maxDepthReached: true ]
							ifFalse: [ Error signal: 'unhandled attention tag : ' , aCollection ] ]
				ifFalse: [ arrVal value: (self createValueWith: aCollection) ] ].
	^ arrVal
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
CallStackJsonReader >> createClassReference: aCollection withId: uniqueId [
	"Instantiate a ClassReference and all its fields"

	| ref |
	ref := model newClassReference.
	ref uniqueID: uniqueId.
	createdReference at: uniqueId put: ref.

	aCollection isString ifTrue: [
			(aCollection sameAs: '<<CLASS_NOT_PREPARED>>')
				ifTrue: [ ^ ref prepared: false ]
				ifFalse: [ Error signal: 'Uneccepted String in class refrence import :' , aCollection ] ].
	aCollection
		collect: [ :field |
				field isCSAttentionTag
					ifTrue: [
							(field sameAs: '<<INACCESSIBLE>>')
								ifTrue: [ self createInaccessibleField ]
								ifFalse: [ Error signal: 'unhandled attention tag : ' , field ] ]
					ifFalse: [ self createField: (field at: #field) ] ]
		thenDo: [ :object | ref addField: object ].
	^ ref
]

{ #category : 'instance creation' }
CallStackJsonReader >> createField: aDictionary [
	"Instantiate a field from a ClassReference"

	| field |
	field := model newField.
	field name: (aDictionary at: #name).
	(aDictionary at: #value) ifNotNil: [ :value |
			value isCSAttentionTag
				ifTrue: [
						(value sameAs: '<<MAX_DEPTH_REACHED>>')
							ifTrue: [ field maxDepthReached: true ]
							ifFalse: [ Error signal: 'unhandled attention tag : ' , value ] ]
				ifFalse: [ field value: (self createValueWith: value) ] ].
	^ field
]

{ #category : 'accessing' }
CallStackJsonReader >> createInaccessibleField [

	| field |
	field := model newField.
	field accessible: false.
	^ field
]

{ #category : 'instance creation' }
CallStackJsonReader >> createMethod: aDictionnary [
	"Instantiate a FamixJavaMethod with the maximum informations possible"

	| method |
	"check if the method already exist"
	createdMethods at: (aDictionnary at: #name) ifPresent: [ :subDict | subDict at: (aDictionnary at: #parentType) ifPresent: [ :m | ^ m ] ].

	method := (model newMethodNamed: (aDictionnary at: #name)) isStub: true.
	method isStatic: ((aDictionnary at: #static) asLowercase = #true
			 ifTrue: [ true ]
			 ifFalse: [ false ]).
	method parentType: (self createClassNamed: (aDictionnary at: #parentType)).

	(self createParameters: (aDictionnary at: #parameters)) do: [ :param | method addParameter: param ].
	"Add the method to not create it again"
	createdMethods at: (aDictionnary at: #name) ifAbsentPut: [ Dictionary new at: (aDictionnary at: #parentType) put: method; yourself ].
	^ method
]

{ #category : 'instance creation' }
CallStackJsonReader >> createMethodCall: aDictionnary [
	"Instatiate the MethodCall of a stack line, being the method informations and the given arguments"

	| methodCall |
	methodCall := model newMethodCall.
	methodCall method: (self createMethod: (aDictionnary at: #method)).

	(aDictionnary at: #arguments) collect: [ :instance | self createArgument: instance ] thenDo: [ :arg | methodCall addArgument: arg ].
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

{ #category : 'instance creation' }
CallStackJsonReader >> createStringReference: aString withId: uniqueId [
	"Instantiate a StringReference"

	| ref |
	ref := model newStringReference.

	ref uniqueID: uniqueId.
	createdReference at: uniqueId put: ref.

	ref value: aString.
	^ ref
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
	"If already created do not create again"
	createdReference at: (aDictionary at: #uniqueId) ifPresent: [ :value | ^ value ].

	reference := self createValueReferenceFor: (aDictionary at: #refered) withId: (aDictionary at: #uniqueId).

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
CallStackJsonReader >> createValueReferenceFor: aCollection withId: uniqueId [
	"Choose which subtype of a ValueReference should be instantiated"

	aCollection isDictionary ifTrue: [
			aCollection at: #fields ifPresent: [ :fields | ^ self createClassReference: fields withId: uniqueId ].
			aCollection at: #elements ifPresent: [ :elements | ^ self createArrayReference: elements withId: uniqueId ] ].

	aCollection isString ifTrue: [
			aCollection isCSAttentionTag
				ifFalse: [ ^ self createStringReference: aCollection withId: uniqueId ]
				ifTrue: [
						(aCollection sameAs: '<<CLASS_NOT_PREPARED>>')
							ifTrue: [ ^ self createClassReference: aCollection withId: uniqueId ]
							ifFalse: [ Error signal: 'Uneccepted attention tag in value reference importation : ', aCollection ] ] ].
	Error signal: 'Should either be String or dictionary'
]

{ #category : 'instance creation' }
CallStackJsonReader >> createValueWith: aDictionnary [
	"Choose which subTypes of a Value should be instantiated"

	"Looking for either a reference or a primitive type, if neither are present throw an error"

	^ aDictionnary at: #reference ifPresent: [ :reference | self createValueReference: reference ] ifAbsent: [
			  aDictionnary
				  at: #primitiveType
				  ifPresent: [ :primitive | self createPrimitiveValue: primitive ]
				  ifAbsent: [ Error signal: 'Unexcepted argument value' ] ]
]

{ #category : 'initialization' }
CallStackJsonReader >> initialize [ 
	createdReference := Dictionary new.
	createdPrimitives := Dictionary new.
	createdClasses := Dictionary new.
	createdMethods := Dictionary new.
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
