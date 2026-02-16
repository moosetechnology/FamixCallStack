"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSField` | `fields` | `FamixCSClassReference` | |
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAccessible` | `Boolean` | true | |
| `isAtMaxDepth` | `Boolean` | false | |
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixCSField',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer + FamixTNamedEntity',
	#classTraits : 'FamixCSTValueContainer classTrait + FamixTNamedEntity classTrait',
	#instVars : [
		'#isAtMaxDepth => FMProperty defaultValue: false',
		'#isAccessible => FMProperty defaultValue: true',
		'#parent => FMOne type: #FamixCSClassReference opposite: #fields'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
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
FamixCSField >> isAccessible [

	<FMProperty: #isAccessible type: #Boolean defaultValue: true>
	<generated>
	^ isAccessible ifNil: [ isAccessible := true ]
]

{ #category : 'accessing' }
FamixCSField >> isAccessible: anObject [
	<generated>
	isAccessible := anObject
]

{ #category : 'accessing' }
FamixCSField >> isAtMaxDepth [

	<FMProperty: #isAtMaxDepth type: #Boolean defaultValue: false>
	<generated>
	^ isAtMaxDepth ifNil: [ isAtMaxDepth := false ]
]

{ #category : 'accessing' }
FamixCSField >> isAtMaxDepth: anObject [
	<generated>
	isAtMaxDepth := anObject
]

{ #category : 'accessing' }
FamixCSField >> parent [
	"Relation named: #parent type: #FamixCSClassReference opposite: #fields"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixCSField >> parent: anObject [

	<generated>
	parent := anObject
]
