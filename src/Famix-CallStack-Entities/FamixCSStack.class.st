"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stacklines` | `FamixCSStack` | `stack` | `FamixCSStackline` | |



"
Class {
	#name : 'FamixCSStack',
	#superclass : 'FamixCSEntity',
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#lines',
		'#stacklines => FMMany type: #FamixCSStackline opposite: #stack'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSStack class >> annotation [

	<FMClass: #Stack super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSStack >> addStackline: anObject [
	<generated>
	^ self stacklines add: anObject
]

{ #category : 'accessing' }
FamixCSStack >> stacklines [
	"Relation named: #stacklines type: #FamixCSStackline opposite: #stack"

	<generated>
	<derived>
	^ stacklines
]

{ #category : 'accessing' }
FamixCSStack >> stacklines: anObject [

	<generated>
	stacklines value: anObject
]

{ #category : 'navigation' }
FamixCSStack >> stacklinesGroup [
	<generated>
	<navigation: 'Stacklines'>
	^ MooseSpecializedGroup withAll: self stacklines asSet
]
