"
A FamixCSArrayReferenceTest is a test class for testing the behavior of FamixCSArrayReference
"
Class {
	#name : 'FamixCSArrayReferenceTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-CallStack-Entities-Tests-Entities',
	#package : 'Famix-CallStack-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixCSArrayReferenceTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"

	reader := CallStackJsonReader new.
	reader model: (FamixCSModel new
			 name: 'testing';
			 yourself).
]

{ #category : 'importing' }
FamixCSArrayReferenceTest >> testSizeAddElement [
	"to test:
	- adding an element augment the size, and reseting element reset the size"

	| arrayReference |
	arrayReference := FamixCSArrayReference new
		                  addElement: FamixCSArrayValue new;
		                  yourself.
	self assert: arrayReference size equals: 1.

	"Remove the element"
	arrayReference elements: {  }.
	self assert: arrayReference size equals: 0
]

{ #category : 'importing' }
FamixCSArrayReferenceTest >> testSizeResetElements [
	"to test:
	- adding an element augment the size, and reseting element reset the size"

	| arrayReference |
	arrayReference := FamixCSArrayReference new.
	
	arrayReference elements: {  }.
	self assert: arrayReference size equals: 0
]
