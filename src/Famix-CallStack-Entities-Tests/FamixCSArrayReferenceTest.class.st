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
FamixCSArrayReferenceTest >> testsize [
	"to test:
	- adding an element augment the size, and reseting element reset the size"

	| arrayReference |
	arrayReference := FamixCSArrayReference new.
	"Start at 0"
	self assert: arrayReference size equals: 0.
	"Add one element"
	arrayReference addElement: FamixCSArrayValue new.
	self assert: arrayReference size equals: 1.

	"Remove the element"
	arrayReference elements: {  }.
	self assert: arrayReference size equals: 0
]
