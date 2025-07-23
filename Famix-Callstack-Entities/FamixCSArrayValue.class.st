"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSArrayValue` | `elements` | `FamixCSArrayReference` | |
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |



"
Class {
	#name : 'FamixCSArrayValue',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer',
	#classTraits : 'FamixCSTValueContainer classTrait',
	#instVars : [
		'#parent => FMOne type: #FamixCSArrayReference opposite: #elements'
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

{ #category : 'printing' }
FamixCSArrayValue >> mooseNameOn: aStream [
	value ifNil:[ aStream nextPutAll: 'nil'] ifNotNil: [ value mooseNameOn: aStream]
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
