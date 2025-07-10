"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stackline` | `FamixCSArgument` | `arguments` | `FamixCSStackline` | |



"
Class {
	#name : 'FamixCSArgument',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#stackline => FMOne type: #FamixCSStackline opposite: #arguments'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSArgument class >> annotation [

	<FMClass: #Argument super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSArgument >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #arguments"

	<generated>
	<container>
	^ stackline
]

{ #category : 'accessing' }
FamixCSArgument >> stackline: anObject [

	<generated>
	stackline := anObject
]

{ #category : 'navigation' }
FamixCSArgument >> stacklineGroup [
	<generated>
	<navigation: 'Stackline'>
	^ MooseSpecializedGroup with: self stackline
]
