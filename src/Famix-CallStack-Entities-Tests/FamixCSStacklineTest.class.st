"
A FamixCSStacklineTest is a test class for testing the behavior of FamixCSStackline
"
Class {
	#name : 'FamixCSStacklineTest',
	#superclass : 'TestCase',
	#category : 'Famix-CallStack-Entities-Tests-Entities',
	#package : 'Famix-CallStack-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'tests' }
FamixCSStacklineTest >> testIndex [

	| stack stackline1 stackline2 |
	stack := FamixCSStack new.

	stack := FamixCSStack new.
	stack addStackline: (stackline1 := FamixCSStackline new).
	stack addStackline: (stackline2 := FamixCSStackline new).

	self assert: stackline1 positionInStack equals: 1.
	self assert: stackline2 positionInStack equals: 2
]

{ #category : 'tests' }
FamixCSStacklineTest >> testNext [

	| stack stackline1 stackline2 |
	stack := FamixCSStack new.

	stack := FamixCSStack new.
	stack addStackline: (stackline1 := FamixCSStackline new).
	stack addStackline: (stackline2 := FamixCSStackline new).

	self assert: stackline1 next equals: stackline2
]

{ #category : 'tests' }
FamixCSStacklineTest >> testPrevious [

	| stack stackline1 stackline2 |
	stack := FamixCSStack new.

	stack := FamixCSStack new.
	stack addStackline: (stackline1 := FamixCSStackline new).
	stack addStackline: (stackline2 := FamixCSStackline new).

	self assert: stackline2 previous equals: stackline1
]
