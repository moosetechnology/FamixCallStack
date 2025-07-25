"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `usage` | `FamixCSValue` | `value` | `FamixCSTValueContainer` | |



"
Class {
	#name : 'FamixCSValue',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#usage => FMMany type: #FamixCSTValueContainer opposite: #value'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSValue class >> annotation [

	<FMClass: #Value super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSValue >> addUsage: anObject [
	<generated>
	^ self usage add: anObject
]

{ #category : 'accessing' }
FamixCSValue >> usage [
	"Relation named: #usage type: #FamixCSTValueContainer opposite: #value"

	<generated>
	<derived>
	^ usage
]

{ #category : 'accessing' }
FamixCSValue >> usage: anObject [

	<generated>
	usage value: anObject
]
