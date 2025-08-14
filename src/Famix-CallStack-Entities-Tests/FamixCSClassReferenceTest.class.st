"
A FamixCSClassReferenceTest is a test class for testing the behavior of FamixCSClassReference
"
Class {
	#name : 'FamixCSClassReferenceTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-CallStack-Entities-Tests-Entities',
	#package : 'Famix-CallStack-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixCSClassReferenceTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"

	reader := CallStackJsonReader new.
	reader model: (FamixCSModel new
			 name: 'testing';
			 yourself)
]
