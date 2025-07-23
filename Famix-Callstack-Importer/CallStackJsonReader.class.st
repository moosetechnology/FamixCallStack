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
	#category : 'Famix-Callstack-Importer',
	#package : 'Famix-Callstack-Importer'
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

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArgument: aDictionary [

	| arg |
	arg := model newArgument.
	aDictionary ifNotNil: [ aDictionary isCSAttentionTag
					 ifTrue: [
							 self flag: #todo. "Should react when an attention tag is seen can be <<UNACCESSIBLE>>"
							 (aDictionary includesSubstring: 'UNACC') ifFalse: [ self halt ].
							 nil ]
					 ifFalse: [ arg value: (self createValueWith: aDictionary) ]].
	^ arg
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArguments: anArray thenDo: aBlock [
	anArray collect: [ :instance | self createArgument: instance ] thenDo: aBlock.
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArrayReference: aCollection withId: uniqueId [

	| ref |
	ref := model newArrayReference.

	ref uniqueID: uniqueId.
	createdReference at: uniqueId put: ref.

	ref size: aCollection size.
	aCollection do: [ :elem | ref addElement: (self createArrayValueWith: elem) ].
	^ ref
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createArrayValueWith: aCollection [

	| arrVal |
	arrVal := model newArrayValue.
	"if the collection (so the value) is nil then there is no need to add anything"
	aCollection ifNotNil: [ aCollection isCSAttentionTag
				ifTrue: [
						self flag: #todo. "Should react when an attention tag is seen can be <<MAX_DEPTH_REACHED>>"
						(aCollection includesSubstring: 'MAX') ifFalse: [ self halt ].
						nil ]
				ifFalse: [arrVal value: (self createValueWith: aCollection) ]].
	^ arrVal
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createClassReference: anArray withId: uniqueId [

	| ref |
	ref := model newClassReference.
	ref uniqueID: uniqueId.
	createdReference at: uniqueId put: ref.
	(anArray
		 collect: [ :col |
				 col isCSAttentionTag
					 ifTrue: [
							 self flag: #todo. "Should react when an attention tag is seen can be <<CLASS_NOT_PREPARED>> or <<UNACCESSIBLE>>"
							 (col includesSubstring: 'CLASS') | (col includesSubstring: 'UNACC') ifFalse: [ self halt ].
							 nil ]
					 ifFalse: [ self createField: (col at: #field) ] ]
		 thenReject: [ :object | object isNil ]) do: [ :object | ref addField: object ].
	^ ref
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createField: aDictionary [

	| field |
	field := model newField.
	field name: (aDictionary at: #name).
	(aDictionary at: #value) ifNotNil: [ :value |
			value isCSAttentionTag
				ifTrue: [
						self flag: #todo. "Should react when an attention tag is seen can be <<MAX_DEPTH_REACHED>>"
						(value includesSubstring: 'MAX') ifFalse: [ self halt ].
						nil ]
				ifFalse: [ field value: (self createValueWith: value) ] ].
	^ field
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createMethod: aDictionnary [

	| method | 
	
	self flag: #todo. "supress duplications of methods use createPrimitiveType"
	self flag: #todo. "maybe we could add more information on the class implementing the used method in the parsing?"
	method := (model newMethodNamed: (aDictionnary at: #name))
		          isStub: true;
		          yourself.

	self createParameters: (aDictionnary at: #parameters) thenDo: [ :param | method addParameter: param ].
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

{ #category : 'instance creation' }
CallStackJsonReader >> createParameters: anArray thenDo: aBlock [
	self flag: #todo. "sometimes the names of the parameters are not given"
	anArray
		collect: [ :param |
				(model newParameterNamed: (param at: #name))
					typing: (model newEntityTyping declaredType: (self createStubClassNamed: (param at: #type)));
					yourself ]
		thenDo: aBlock
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createPrimitiveType: aString [

	^ createdClasses at: aString ifAbsentPut: [
			  (model newPrimitiveTypeNamed: aString)
				  isStub: true;
				  yourself ]
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createPrimitiveValue: aDictionary [

	| primVal primType |
	primVal := model newPrimitiveValue.
	self flag: #todo. "Change the typing with a typing entity to reify the link like for paramaters"
	primType := self createPrimitiveType: (aDictionary at: #type).
	primVal type: primType.
	primVal value: (aDictionary at: #value).
	^ primVal
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createReceiver: aDictionary [

	^ self createValueReference: (aDictionary at: #reference)
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createStringReference: aString withId: uniqueId [

	| ref |
	ref := model newStringReference.

	ref uniqueID: uniqueId.
	createdReference at: uniqueId put: ref.

	ref value: aString.
	^ ref
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createStubClassNamed: aString [

	self flag: #todo. "how to differentiates java.lang.String and java.lang.String[] without 2 object?"
	^ createdClasses at: aString ifAbsentPut: [
			  (model newClassNamed: aString)
				  isStub: true;
				  yourself ]
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createValueReference: aDictionary [

	| reference refered |
	"If already created do not create again"
	createdReference at: (aDictionary at: #uniqueId) ifPresent: [ :value | ^ value ].

	refered := aDictionary at: #refered.
	reference := self createValueReferenceFor: refered withId: (aDictionary at: #uniqueId).
	reference type: (aDictionary at: #type).

	^ reference
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createValueReferenceFor: aCollection  withId: uniqueId [

	aCollection isDictionary ifTrue: [
			aCollection at: #fields ifPresent: [ :fields | ^ self createClassReference: fields withId: uniqueId].
			aCollection at: #elements ifPresent: [ :elements | ^ self createArrayReference: elements withId: uniqueId ] ].
	self flag: #todo. "could also be a maxdepth message or other things"
	aCollection isByteString ifTrue: [
			aCollection isCSAttentionTag
				ifFalse: [ ^ self createStringReference: aCollection withId: uniqueId ]
				ifTrue: [
						self flag: #todo. "the actual problem here is that when an object can contain itself it will study it again before being added in foundReference"
						Error signal: 'Should not be an attentionTag, this should be detected after coming to this method' ] ].
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
	createdReference := Dictionary new.
	createdPrimitives := Dictionary new.
	createdClasses := Dictionary new.
	createdMethods := Dictionary new.
]

{ #category : 'instance creation' }
CallStackJsonReader >> parseFromLine: aDictionnary [

	| line |
	line := model newStackline.

	line methodCall: (self createMethodCall: aDictionnary).
	(aDictionnary at: #receiver) ifNotNil: [ :receiver | line receiver: (self createReceiver: receiver) ].
	^ line
]

{ #category : 'meta-object-protocol' }
CallStackJsonReader >> read: json [
	"Loads parsed json"

	| stack lines |
	json ifEmpty: [ Error signal: 'The json file is empty' ] ifNotEmpty: [
			model := FamixCSModel new
				         name: filename;
				         yourself.
			stack := model newStack.
			lines := json at: #Lines. "Get the lines"
			lines do: [ :line | stack addStackline: (self parseFromLine: line) ].
			model entities do: #resetMooseName ]
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
