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
| `name` | `String` | nil | |

"
Class {
	#name : 'FamixCSField',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer',
	#classTraits : 'FamixCSTValueContainer classTrait',
	#instVars : [
		'#isAccessible => FMProperty defaultValue: true',
		'#isAtMaxDepth => FMProperty defaultValue: false',
		'#name => FMProperty',
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

{ #category : 'testing' }
FamixCSField >> isField [

	^ true
]

{ #category : 'printing' }
FamixCSField >> mooseNameOn: aStream [

	aStream nextPutAll: name.
	(self isAccessible and: [ self isAtMaxDepth not ]) ifFalse: [ ^ self ].
	aStream nextPutAll: ' = '.

	value
		ifNotNil: [ value mooseNameOn: aStream ]
		ifNil: [ aStream print: nil ]
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
	"Relation named: #parent type: #FamixCSClassReference opposite: #fields"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixCSField >> parent: anObject [

	<generated>
	parent := anObject
]
