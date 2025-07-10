"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stackline` | `FamixCSReceiver` | `receiver` | `FamixCSStackline` | |



"
Class {
	#name : 'FamixCSReceiver',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#stackline => FMOne type: #FamixCSStackline opposite: #receiver'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSReceiver class >> annotation [

	<FMClass: #Receiver super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSReceiver >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #receiver"

	<generated>
	<container>
	<derived>
	^ stackline
]

{ #category : 'accessing' }
FamixCSReceiver >> stackline: anObject [

	<generated>
	stackline := anObject
]

{ #category : 'navigation' }
FamixCSReceiver >> stacklineGroup [
	<generated>
	<navigation: 'Stackline'>
	^ MooseSpecializedGroup with: self stackline
]
