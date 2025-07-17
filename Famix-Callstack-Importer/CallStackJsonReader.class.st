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

{ #category : 'instance creation' }
CallStackJsonReader >> createArgument: aDictionnary [
	"instanciate an argument in different ways depending on if it is a reference or a primitive object"

	| arg |
	"Looking for either a reference or a primitive type, if neither are present throw an error"
	aDictionnary
		at: #reference
		ifPresent: [ :reference | self halt ]
		ifAbsent: [ aDictionnary at: #primitiveType ifPresent: [ :primitive | self halt ] ifAbsent: [ Error signal: 'Unexcepted argument value' ] ].

	arg := model newArgument.
	^ arg
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArgument: aFamixCSStackline with: aDictionnary [
	aDictionnary collect: [ :argument | self createArgument: argument ] thenDo: [ :famixArgument | aFamixCSStackline addArgument: famixArgument ]
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createMethod: aFamixCSStackline with: aDictionnary [

	| method |
	self flag:#todo. "should we make the method a stub to know it has to be completed by another model?"
	self flag:#todo. "maybe we could add more information on the class implementing the used method in the parsing?"
	method := model newMethodNamed: (aDictionnary at: #name).
	method stackline: aFamixCSStackline.

	self flag: #todo. "what we give to the parameter is actually the type, but how are we supposed to create a FamixJavaParameter with just the type? is this really usefull ?"
	self flag:#todo. "Maybe FamixJavaMethod already have somewhere to put the parameters, and should not be defined by the callstack generator"
	method parameters: ((aDictionnary at: #parameters) collect: [ :type | (model newParameterNamed: type) method: method ])
]

{ #category : 'as yet unclassified' }
CallStackJsonReader >> createReceiver: aFamixCSStackline with: aDictionnary [

	aDictionnary ifNotNil: [ :dict |
			dict
				at: #reference
				ifPresent: [ :informations | foundReference at: (informations at: #uniqueId) ifPresent: [ self halt ] ifAbsentPut: [ self halt ] ]
				ifAbsent: [ Error signal: 'The only possible key should be #reference' ] ]
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
	line number: lineNumber. 
	lineNumber := lineNumber + 1.
	"Setting and reseting the previous line"
	line previous: prevLine.
	prevLine := line.
	
	self createMethod: line with: (aDictionnary at: #method).
	self createReceiver: line with: (aDictionnary at: #receiver).
	self flag:#todo."uncommment this when implemented"
	"self createArgument: line with: (aDictionnary at: #arguments)."
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
