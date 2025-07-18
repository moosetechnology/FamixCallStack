"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `instance` | `FamixCSField` | `fields` | `FamixCSInstance` | |
| `objectReference` | `FamixCSField` | `fields` | `FamixCSObjectReference` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | |

"
Class {
	#name : 'FamixCSField',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#name => FMProperty',
		'#objectReference => FMOne type: #FamixCSObjectReference opposite: #fields',
		'#instance => FMOne type: #FamixCSInstance opposite: #fields'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSField class >> annotation [

	<FMClass: #Field super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSField >> instance [
	"Relation named: #instance type: #FamixCSInstance opposite: #fields"

	<generated>
	^ instance
]

{ #category : 'accessing' }
FamixCSField >> instance: anObject [

	<generated>
	instance := anObject
]

{ #category : 'accessing' }
FamixCSField >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : 'accessing' }
FamixCSField >> name: anObject [
	<generated>
	name := anObject
]

{ #category : 'accessing' }
FamixCSField >> objectReference [
	"Relation named: #objectReference type: #FamixCSObjectReference opposite: #fields"

	<generated>
	^ objectReference
]

{ #category : 'accessing' }
FamixCSField >> objectReference: anObject [

	<generated>
	objectReference := anObject
]
