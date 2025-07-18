"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSArrayValue` | `elements` | `FamixCSArrayReference` | |
| `value` | `FamixCSArrayValue` | `fieldUsages` | `FamixCSValue` | |



"
Class {
	#name : 'FamixCSArrayValue',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#parent => FMOne type: #FamixCSArrayReference opposite: #elements',
		'#value => FMOne type: #FamixCSValue opposite: #fieldUsages'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSArrayValue class >> annotation [

	<FMClass: #ArrayValue super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSArrayValue >> parent [
	"Relation named: #parent type: #FamixCSArrayReference opposite: #elements"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixCSArrayValue >> parent: anObject [

	<generated>
	parent := anObject
]

{ #category : 'accessing' }
FamixCSArrayValue >> value [
	"Relation named: #value type: #FamixCSValue opposite: #fieldUsages"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSArrayValue >> value: anObject [

	<generated>
	value := anObject
]
