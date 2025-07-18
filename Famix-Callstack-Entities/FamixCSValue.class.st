"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentUsages` | `FamixCSValue` | `value` | `FamixCSArgument` | |
| `fieldUsages` | `FamixCSValue` | `value` | `FamixCSArrayValue` | |
| `fieldUsages` | `FamixCSValue` | `value` | `FamixCSField` | |
| `methodUsages` | `FamixCSValue` | `arguments` | `FamixCSMethodCall` | |



"
Class {
	#name : 'FamixCSValue',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#methodUsages => FMMany type: #FamixCSMethodCall opposite: #arguments',
		'#fieldUsages => FMMany type: #FamixCSField opposite: #value',
		'#argumentUsages => FMMany type: #FamixCSArgument opposite: #value'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
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
FamixCSValue >> addArgumentUsage: anObject [
	<generated>
	^ self argumentUsages add: anObject
]

{ #category : 'adding' }
FamixCSValue >> addFieldUsage: anObject [
	<generated>
	^ self fieldUsages add: anObject
]

{ #category : 'adding' }
FamixCSValue >> addMethodUsage: anObject [
	<generated>
	^ self methodUsages add: anObject
]

{ #category : 'accessing' }
FamixCSValue >> argumentUsages [
	"Relation named: #argumentUsages type: #FamixCSArgument opposite: #value"

	<generated>
	<derived>
	^ argumentUsages
]

{ #category : 'accessing' }
FamixCSValue >> argumentUsages: anObject [

	<generated>
	argumentUsages value: anObject
]

{ #category : 'accessing' }
FamixCSValue >> fieldUsages [
	"Relation named: #fieldUsages type: #FamixCSField opposite: #value"

	<generated>
	<derived>
	^ fieldUsages
]

{ #category : 'accessing' }
FamixCSValue >> fieldUsages: anObject [

	<generated>
	fieldUsages value: anObject
]

{ #category : 'accessing' }
FamixCSValue >> methodUsages [
	"Relation named: #methodUsages type: #FamixCSMethodCall opposite: #arguments"

	<generated>
	^ methodUsages
]

{ #category : 'accessing' }
FamixCSValue >> methodUsages: anObject [

	<generated>
	methodUsages value: anObject
]
