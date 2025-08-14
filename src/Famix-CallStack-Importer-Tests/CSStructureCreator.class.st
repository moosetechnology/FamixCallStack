Class {
	#name : 'CSStructureCreator',
	#superclass : 'Object',
	#category : 'Famix-CallStack-Importer-Tests',
	#package : 'Famix-CallStack-Importer-Tests'
}

{ #category : 'setup' }
CSStructureCreator class >> simpleArrayReferenceDict [

	^ Dictionary new
		  at: #reference put: (Dictionary new
				   at: #refered put: (Dictionary new
						    at: #elements put: {  };
						    yourself);
				   at: #uniqueId put: 1;
				   at: #type put: 'int[]';
				   yourself);
		  yourself
]

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
		  at: #primitiveValue put: (Dictionary new
				   at: #type put: #int;
				   at: #value put: 42;
				   yourself);
		  yourself
]

{ #category : 'setup' }
CSStructureCreator class >> simpleStacklineDict [

	^ self simpleMethodCallDict
		  at: #receiver put: self simpleArrayReferenceDict;
		  yourself
]

{ #category : 'setup' }
CSStructureCreator class >> simpleValueDict [
	"Provide a simple value structure"
	
	^ self simplePrimitiveValueDict
]
