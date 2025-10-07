"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSArrayValue` | `elements` | `FamixCSArrayReference` | |
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAtMaxDepth` | `Boolean` | false | |

"
Class {
	#name : 'FamixCSArrayValue',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer',
	#classTraits : 'FamixCSTValueContainer classTrait',
	#instVars : [
		'#isAtMaxDepth => FMProperty defaultValue: false',
		'#parent => FMOne type: #FamixCSArrayReference opposite: #elements'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
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
FamixCSArrayValue >> isAtMaxDepth [

	<FMProperty: #isAtMaxDepth type: #Boolean defaultValue: false>
	<generated>
	^ isAtMaxDepth ifNil: [ isAtMaxDepth := false ]
]

{ #category : 'accessing' }
FamixCSArrayValue >> isAtMaxDepth: anObject [
	<generated>
	isAtMaxDepth := anObject
]

{ #category : 'printing' }
FamixCSArrayValue >> mooseNameOn: aStream [

	value ifNil: [ aStream print: nil ] ifNotNil: [ value mooseNameOn: aStream ]
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
