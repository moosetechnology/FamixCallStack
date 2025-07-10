"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stackline` | `FamixCSMethod` | `method` | `FamixCSStackline` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | |

"
Class {
	#name : 'FamixCSMethod',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#name => FMProperty',
		'#stackline => FMOne type: #FamixCSStackline opposite: #method'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSMethod class >> annotation [

	<FMClass: #Method super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSMethod >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
FamixCSMethod >> name: anObject [
	<generated>
	name := anObject
]

{ #category : 'accessing' }
FamixCSMethod >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #method"

	<generated>
	<container>
	<derived>
	^ stackline
]

{ #category : 'accessing' }
FamixCSMethod >> stackline: anObject [

	<generated>
	stackline := anObject
]

{ #category : 'navigation' }
FamixCSMethod >> stacklineGroup [
	<generated>
	<navigation: 'Stackline'>
	^ MooseSpecializedGroup with: self stackline
]
