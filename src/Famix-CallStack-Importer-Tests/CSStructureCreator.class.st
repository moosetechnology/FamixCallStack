Class {
	#name : 'CSStructureCreator',
	#superclass : 'Object',
	#category : 'Famix-CallStack-Importer-Tests',
	#package : 'Famix-CallStack-Importer-Tests'
}

{ #category : 'setup' }
CSStructureCreator class >> simpleFieldDict [

	| fieldDict |
	fieldDict := Dictionary new.
	fieldDict at: #name put: #aField.
	fieldDict at: #value put: self simpleValueDict.
	^ fieldDict
]

{ #category : 'setup' }
CSStructureCreator class >> simpleMethodCallDict [

	| methodCallDict argsDict methodDict |
	methodCallDict := Dictionary new.
	methodCallDict at: #arguments put: (argsDict := Dictionary new).
	argsDict at: #argsValues put: {  }.

	"create a simple method with no paremeter to make sure no errors happens from having no arguments"
	methodDict := self simpleMethodDict.
	methodDict at: #parameters put: {  }.
	methodCallDict at: #method put: methodDict.
	^ methodCallDict
]

{ #category : 'setup' }
CSStructureCreator class >> simpleMethodDict [

	| methodDict |
	methodDict := Dictionary new.
	methodDict at: #name put: #main.
	methodDict at: #parentType put: 'Pharo'.
	methodDict at: #isClassSide put: true.

	methodDict at: #parameters put: {  }.
	^ methodDict
]

{ #category : 'setup' }
CSStructureCreator class >> simpleParameterDict [

	^ Dictionary new
		  at: #name put: #args;
		  at: #type put: #Pharo;
		  yourself
]

{ #category : 'setup' }
CSStructureCreator class >> simplePrimitiveValueDict [

	^ Dictionary new
		  at: #type put: #int;
		  at: #value put: 42;
		  yourself
]

{ #category : 'setup' }
CSStructureCreator class >> simpleValueDict [
	"Provide a simple value structure"

	"Used to make a valid structure while not needing to pay attention to the value"

	| primValDict |
	primValDict := Dictionary new.
	primValDict at: #primitiveType put: self simplePrimitiveValueDict.

	^ primValDict
]
