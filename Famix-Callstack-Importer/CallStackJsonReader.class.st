Class {
	#name : 'CallStackJsonReader',
	#superclass : 'Object',
	#instVars : [
		'filename',
		'model',
		'lineNumber',
		'foundReference',
		'prevLine'
	],
	#category : 'Famix-Callstack-Importer',
	#package : 'Famix-Callstack-Importer'
}

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArgument: aDictionary [

	| arg |
	arg := model newArgument.
	aDictionary ifNotNil: [ :value | arg value: (self createValueWith: value) ].
	^ arg
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArguments: anArray thenDo: aBlock [
	anArray collect: [ :instance | self createArgument: instance ] thenDo: aBlock.
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArrayReference: aCollection [

	| ref |
	ref := model newArrayReference.
	ref size: aCollection size.
	aCollection do: [ :elem | ref addElement: (self createArrayValueWith: elem) ].
	^ ref
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArrayValueWith: aCollection [

	| arrVal |
	arrVal := model newArrayValue.
	"if the collection (so the value) is nil then there is no need to add anything"
	aCollection ifNotNil: [ arrVal value: (self createValueWith: aCollection) ].
	^ arrVal
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createClassReference: anArray [
	| ref | 
	ref := model newClassReference.
	anArray collect:[:dict | self createField: (dict at: #field)] thenDo:[:object | ref addField: object].
	^ ref
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createField: aDictionary [

	| field |
	field := model newField.
	field name: (aDictionary at: #name).
	(aDictionary at: #value) ifNotNil: [ :value | field value: (self createValueWith: value) ].
	^ field
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createMethod: aDictionnary [

	| method |
	self flag: #todo. "should we make the method a stub to know it has to be completed by another model?"
	self flag: #todo. "maybe we could add more information on the class implementing the used method in the parsing?"
	method := model newMethodNamed: (aDictionnary at: #name).


	self flag: #todo. "what we give to the parameter is actually the type, but how are we supposed to create a FamixJavaParameter with just the type? is this really usefull ?"
	self flag: #todo. "Maybe FamixJavaMethod already have somewhere to put the parameters, and should not be defined by the callstack generator"
	(aDictionnary at: #parameters) do: [ :type | method addParameter: (model newParameterNamed: type) ].
	^ method
]

{ #category : 'instance creation' }
CallStackJsonReader >> createMethodCall: aDictionnary [

	| methodCall |
	methodCall := model newMethodCall.
	methodCall method: (self createMethod: (aDictionnary at: #method)).
	
	self createArguments: (aDictionnary at: #arguments) thenDo: [ :arg | methodCall addArgument: arg ].
	^ methodCall
]

{ #category : 'instance creation' }
CallStackJsonReader >> createMethodCall: aFamixCSStackline with: aDictionnary [
	| methodCall |
	methodCall := model newMethodCall.
	aFamixCSStackline methodCall: methodCall.
	methodCall method: (self createMethod: (aDictionnary at:#method)).
	
	self createArguments: (aDictionnary at: #arguments) thenDo: [:arg | methodCall addArgument: arg].
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createPrimitiveValue: aDictionary [

	| primVal primType |
	primVal := model newPrimitiveValue.
	self flag: #todo. "Maybe the primitiveType should be a stub or something like that so that we can make a link to java model"
	primType := model newPrimitiveTypeNamed: (aDictionary at: #type).
	primVal type: primType.
	primVal value: (aDictionary at: #value).
	^ primVal
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createReceiver: aDictionary [

	^ self createValueReference: (aDictionary at: #reference)
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createStringReference: aString [ 
	| ref |
	ref := model newStringReference.
	ref value: aString.
	^ ref
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createValueReference: aDictionary [

	| reference refered |
	"If already found do not create again"
	foundReference at: (aDictionary at: #uniqueId) ifPresent: [ :value | ^ value ].

	refered := aDictionary at: #refered.
	reference := self createValueReferenceFor: refered.
	reference uniqueID: (aDictionary at: #uniqueId).
	reference type: (aDictionary at: #type).

	"Add the reference to already found objects"
	foundReference at: (aDictionary at: #uniqueId) put: reference.
	^ reference
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createValueReferenceFor: aCollection [

	aCollection isDictionary ifTrue: [
			aCollection at: #fields ifPresent: [ :fields | ^ self createClassReference: fields ].
			aCollection at: #elements ifPresent: [ :elements | ^ self createArrayReference: elements ] ].
	self flag: #todo. "could also be a maxdepth message or other things"
	aCollection isByteString ifTrue: [ ^ self createStringReference: aCollection ].
	Error signal: 'Should either be String, array or an object'
]

{ #category : 'instance creation' }
CallStackJsonReader >> createValueWith: aDictionnary [
	"instanciate the element in different ways depending on if it is a reference or a primitive object"

	"Looking for either a reference or a primitive type, if neither are present throw an error"

	^ aDictionnary at: #reference ifPresent: [ :reference | self createValueReference: reference ] ifAbsent: [
			  aDictionnary
				  at: #primitiveType
				  ifPresent: [ :primitive | self createPrimitiveValue: primitive ]
				  ifAbsent: [ Error signal: 'Unexcepted argument value' ] ]
]

{ #category : 'initialization' }
CallStackJsonReader >> initialize [ 
	lineNumber := 1. "Start the count on 1"
	foundReference := Dictionary new.
	
]

{ #category : 'instance creation' }
CallStackJsonReader >> parseFromLine: aDictionnary [

	| line |
	line := model newStackline.
	"setting and incrementing the line number"
	self flag: #todo. "the line number could be added direclty on the parsing and should not be done here"
	line number: lineNumber.
	lineNumber := lineNumber + 1.
	self flag: #todo. "Should previous line be added like that?"
	"Setting and reseting the previous line"
	line previous: prevLine.
	prevLine := line.

	line methodCall: (self createMethodCall: aDictionnary).
	(aDictionnary at: #receiver) ifNotNil:[:receiver | line receiver: (self createReceiver: receiver)]
]

{ #category : 'meta-object-protocol' }
CallStackJsonReader >> read: json [
	"Loads parsed json"

	| lines |
	json ifEmpty: [ Error signal: 'The json file is empty' ] ifNotEmpty: [
			model := FamixCSModel new
				         name: filename;
				         yourself.
			lines := json at: #Lines. "Get the lines"
			lines do: [ :line | self parseFromLine: line ] ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> readFrom: aFileReference [ 
	| reader |

	filename := aFileReference basename. 
	reader := NeoJSONReader on: aFileReference readStream.
	self read: reader next.
	reader close.

	^ model
]
