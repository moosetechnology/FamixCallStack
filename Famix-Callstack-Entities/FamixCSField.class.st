"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSField` | `field` | `FamixCSClassReference` | |
| `value` | `FamixCSField` | `fieldUsages` | `FamixCSValue` | |


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
		'#parent => FMOne type: #FamixCSClassReference opposite: #field',
		'#value => FMOne type: #FamixCSValue opposite: #fieldUsages'
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
FamixCSField >> parent [
	"Relation named: #parent type: #FamixCSClassReference opposite: #field"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixCSField >> parent: anObject [

	<generated>
	parent := anObject
]

{ #category : 'accessing' }
FamixCSField >> value [
	"Relation named: #value type: #FamixCSValue opposite: #fieldUsages"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSField >> value: anObject [

	<generated>
	value := anObject
]
