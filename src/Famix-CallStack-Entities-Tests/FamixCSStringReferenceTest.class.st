"
A FamixCSStringReferenceTest is a test class for testing the behavior of FamixCSStringReference
"
Class {
	#name : 'FamixCSStringReferenceTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-CallStack-Entities-Tests-Entities',
	#package : 'Famix-CallStack-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixCSStringReferenceTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	
	reader := CallStackJsonReader new.
	reader model: (FamixCSModel new
			 name: 'testing';
			 yourself)
]
