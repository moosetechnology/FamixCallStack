"
A FamixCSStackTest is a test class for testing the behavior of FamixCSStack
"
Class {
	#name : 'FamixCSStackTest',
	#superclass : 'TestCase',
	#instVars : [
		'stack'
	],
	#category : 'Famix-CallStack-Entities-Tests-Entities',
	#package : 'Famix-CallStack-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixCSStackTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	
	stack := FamixCSStack new.
]

{ #category : 'tests' }
FamixCSStackTest >> testIndexOfLine [

	| line1 line2 |
	line1 := stack addStackline: FamixCSStackline new.
	line2 := stack addStackline: FamixCSStackline new.

	self assert: (stack indexOfLine: line1) equals: 1.
	self assert: (stack indexOfLine: line2) equals: 2
]

{ #category : 'tests' }
FamixCSStackTest >> testNextTo [

	| line1 line2 |
	line1 := stack addStackline: FamixCSStackline new.
	line2 := stack addStackline: FamixCSStackline new.

	self assert: (stack nextTo: line1) equals: line2.
	self assert: (stack nextTo: line2) equals: nil
]

{ #category : 'tests' }
FamixCSStackTest >> testPreviousTo [

	| line1 line2 |
	line1 := stack addStackline: FamixCSStackline new.
	line2 := stack addStackline: FamixCSStackline new.

	self assert: (stack previousTo: line2) equals: line1.
	self assert: (stack previousTo: line1) equals: nil.
]
