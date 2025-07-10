Class {
	#name : 'CallStackJsonReader',
	#superclass : 'Object',
	#instVars : [
		'filename',
		'model'
	],
	#category : 'Famix-Callstack-Importer',
	#package : 'Famix-Callstack-Importer'
}

{ #category : 'instance creation' }
CallStackJsonReader >> createArgument: aCollection [
	"instanciate an argument in different ways depending on if it is a reference or a direct object"
	| arg |
	self flag: #todo. "continue to write the importer from here on"
	self flag: #todo. "An argument can be supposed to always be a reference? maybe not for int? check this on java"
	arg := model addArgument.
	^ arg
]

{ #category : 'instance creation' }
CallStackJsonReader >> createArgument: aFamixCSStackline with: aCollection [
	self flag:#todo. "if an argument is always a reference, the method createArgument might not be usefull"
	aCollection collect: [ :argument | self createArgument: argument ] thenDo: [ :famixArgument | aFamixCSStackline addArgument: famixArgument ]
]

{ #category : 'instance creation' }
CallStackJsonReader >> parseFromLine: aCollection [

	| line |
	line := model newStackline.
	
	self createArgument: line with: (aCollection at: #arguments).
]

{ #category : 'meta-object-protocol' }
CallStackJsonReader >> read: json [
	"Loads parsed json"

	| lines |
	json ifEmpty: [ Error signal: 'The json file is empty' ] ifNotEmpty: [
			model := FamixCSModel new
				         name: filename;
				         yourself.

			lines := json at: #Lines.

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
