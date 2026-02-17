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
		'createdReference',
		'createdSourcesPackages',
		'defaultPackage'
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

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArguments: aDictionary forStackline: aStackline [

	| accessible argValuesDict |
	"Default: accessible if not specified"
	accessible := aDictionary at: #accessible ifAbsent: true.
	"Default: accessible if not specified"
	argValuesDict := aDictionary at: #argsValues ifAbsent: nil.
	aStackline isArgsAccessible: accessible.

	"Checking if the method call has a valid construction
	Should be either
	- accessible and have a value
	- inaccessible and dont have a value"
	accessible ~= argValuesDict notNil ifTrue: [
			Error signal:
				'Invalid methodCall arguments accessibility or description' ].

	accessible
		ifTrue: [
				argValuesDict do: [ :argDict |
					aStackline addArgument: (self createArgument: argDict) ] ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArrayValueWith: aCollection [
	"Instantiate an ArrayValue"
	^ self fillValueCheckingMaxDepthOn: model newArrayValue with: aCollection.
]

{ #category : 'instance creation' }
CallStackJsonReader >> createClassNamed: aString [
	"Instantiate a FamixJavaClass with the given name"

	| sequence container name |
	sequence := (aString removeSuffix: '[]') splitOn: $..
	name := sequence last.

	container := self createPackageFromStringCollection: sequence allButLast.
	^ createdClasses at: name ifAbsentPut: [
			  (model newClassNamed: name)
				  typeContainer: container;
				  isStub: true;
				  yourself ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> createField: aDictionary [
	"Instantiate a field from a ClassReference"

	| field valueDict accessible |
	"Default: accessible if not specified"
	accessible := aDictionary at: #accessible ifAbsent: [ true ].
	"Default: nil if not specified"
	valueDict := aDictionary at: #value ifAbsent: nil.

	"Checking if the field has a valid construction
	Should be either
	- accessible and have a value
	- inaccessible and dont have a value"
	accessible ~= (aDictionary includesKey: #value) ifTrue: [
		Error signal: 'Field has not a valid construction' ].

	field := model newField
		         name: (aDictionary at: #name);
		         isAccessible: accessible;
		         yourself.

	^ self fillValueCheckingMaxDepthOn: field with: valueDict
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

{ #category : 'accessing' }
CallStackJsonReader >> createPackageFromStringCollection: aCollection [

	| currentParent |
	"if the collection is empty then return the default package"
	aCollection ifEmpty: [ ^ self defaultPackage ].
	
	"Search for the source package"
	currentParent := createdSourcesPackages at: aCollection first ifAbsentPut: [ model newPackageNamed: aCollection first ].

	"If we are in a source package, then return it now"
	aCollection size = 1 ifTrue: [ ^ currentParent ].

	"If in nested package create all and return the deepest one"
	aCollection allButFirst do: [ :each | currentParent := self createPackageNamed: each withParent: currentParent ].
	^ currentParent
]

{ #category : 'accessing' }
CallStackJsonReader >> createPackageNamed: aString withParent: aPackage [

	^ aPackage childEntities detect: [ :each | each name = aString ] ifNone: [
			  (model newPackageNamed: aString)
				  parentPackage: aPackage;
				  yourself ]
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

	aDictionary at: #reference ifPresent: [ :reference | ^ model newReceiver value: (self createValueReference: (aDictionary at: #reference)) ].
	aDictionary at: #primitiveValue ifPresent: [ :primitive | Error signal: 'Receiver should not be a primitiveType argument value' ].
	Error signal: 'Unexcepted receiver value'
]

{ #category : 'instance creation' }
CallStackJsonReader >> createStackline: aDictionary [
	"Instantiate a line of a stack"

	| line |
	line := model newStackline.
	
	(aDictionary at: #receiver) ifNotNil: [ :receiver | line receiver: (self createReceiver: receiver) ].
	line method: (self createMethod: (aDictionary at: #method)).
	
	aDictionary
		at: #method
		ifPresent: [ :methodDict | line method: (self createMethod: methodDict) ]
		ifAbsent: [ Error signal: 'MethodCall has no method' ].
		
	(self createArguments: (aDictionary at: #arguments) forStackline: line).
	self validateStackline: line.
	self linkArgumentsAndParameterOfStackline: line.

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

	| reference type uniqueId typeName |
	uniqueId := aDictionary at: #uniqueId.

	"Check alreadyFound case"
	(aDictionary at: #alreadyFound ifAbsent: [ false ]) ifTrue: [
			^ createdReference at: uniqueId ifAbsent: [
				  Error signal:
					  'The objectReference with ID: ' , uniqueId asString , ' is indicated to be already found, but is not in the saved references' ] ].

	"Ensure no duplicate creation"
	reference := createdReference
		             at: uniqueId
		             ifPresent: [
		             Error signal:
			             'Trying to create an object with ID: ' , uniqueId asString , ' while an existing ObjectReference already has this ID' ]
		             ifAbsentPut: [ (self instantiateReferenceEntityFrom: aDictionary) uniqueID: uniqueId ].

	"Fill reference"
	reference fillFrom: (aDictionary at: #refered) reader: self.
	
	typeName := aDictionary at: #type.
	"Determine type"
	type := (typeName includesSubstring: '.')
		        ifTrue: [ self createClassNamed: typeName ]
		        ifFalse: [ self createPrimitiveType: typeName ].

	self createTypingFor: reference with: type.

	^ reference
]

{ #category : 'instance creation' }
CallStackJsonReader >> createValueWith: aDictionnary [
	"Choose which subTypes of a Value should be instantiated"

	"Looking for either a reference or a primitive type, if neither are present throw an error"

	aDictionnary at: #reference ifPresent: [ :reference | ^ self createValueReference: reference ].
	aDictionnary at: #primitiveValue ifPresent: [ :primitive | ^ self createPrimitiveValue: primitive ].
	Error signal: 'Unexcepted argument value'
]

{ #category : 'accessing' }
CallStackJsonReader >> defaultPackage [

	^ defaultPackage ifNil: [ defaultPackage := model newPackageNamed: '<Default Package>' ]
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
	createdSourcesPackages := Dictionary new
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> instantiateMethodFrom: aDictionnary [

	| method |
	method := (model newMethodNamed: (aDictionnary at: #name)) isStub: true.

	method isClassSide: (aDictionnary at: #isClassSide).
	method parentType: (self createClassNamed: (aDictionnary at: #parentType)).
	method signature: (aDictionnary at: #signature).

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
			^ (refered sameAs: '<<CLASS_NOT_PREPARED>>')
				  ifTrue: [
						  model newClassReference
							  isPrepared: false;
							  yourself ]
				  ifFalse: [ model newStringReference ] ].
	Error signal: 'Should either be String or dictionary'
]

{ #category : 'instance creation' }
CallStackJsonReader >> linkArgumentsAndParameterOfStackline: aStackline [
	"Assumption: from parsing to this method call, parameters and arguments remain in the same order.
 This relies on:
  - The parser recording arguments and parameters in the order they appear in the method declaration and call.
  - NeoJSONReader preserving the order of collections.
  - MooseGroups being ordered collections."

	| paramIte param |
	paramIte := aStackline method parameters iterator.
	aStackline arguments do: [ :arg |
			param := paramIte next.
			arg parameter: param ]
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

	| stack lines valueIndependents |
	json ifEmpty: [ Error signal: 'The json file is empty' ] ifNotEmpty: [
			model := FamixCSModel new
				         name: filename;
				         yourself.
			stack := model newStack.
			
			valueIndependents := json at: #valueIndependents.
			lines := json at: #Lines. 
			
			lines do: [ :line |
					valueIndependents ifTrue: [ createdReference := Dictionary new ].
					stack addStackline: (self createStackline: line) ].
			"reset moose name to make sure no error appear"
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

{ #category : 'as yet unclassified' }
CallStackJsonReader >> validateStackline: aStackline [
	"Checking that number of parameters and arguments match in case arguments are accessibles"

	(aStackline isArgsAccessible and: [ aStackline method parameters size ~= aStackline arguments size ]) ifTrue: [
		Error signal: 'Stackline have accessible arguments, but the number of arguments and number of parameter of its method doesnt match' ]
]
