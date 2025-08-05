"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FamixCSArrayReference` | `parent` | `FamixCSArrayValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `size` | `Number` | nil | |

"
Class {
	#name : 'FamixCSArrayReference',
	#superclass : 'FamixCSObjectReference',
	#traits : 'FamixCSTEntityMetaLevelDependency',
	#classTraits : 'FamixCSTEntityMetaLevelDependency classTrait',
	#instVars : [
		'#elements => FMMany type: #FamixCSArrayValue opposite: #parent',
		'#size => FMProperty'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSArrayReference class >> annotation [

	<FMClass: #ArrayReference super: #FamixCSObjectReference>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSArrayReference >> addElement: anObject [
	<generated>
	^ self elements add: anObject
]

{ #category : 'accessing' }
FamixCSArrayReference >> elements [
	"Relation named: #elements type: #FamixCSArrayValue opposite: #parent"

	<generated>
	<derived>
	^ elements
]

{ #category : 'accessing' }
FamixCSArrayReference >> elements: anObject [

	<generated>
	elements value: anObject
]

{ #category : 'printing' }
FamixCSArrayReference >> mooseNameOn: aStream [

	super mooseNameOn: aStream.
	aStream nextPutAll: ' ['.
	elements ifNotEmpty: [
			elements first mooseNameOn: aStream.
			elements allButFirstDo: [ :elem |
					aStream nextPutAll: ', '.
					elem ifNil: [ aStream nextPutAll: 'nil' ] ifNotNil: [ elem mooseNameOn: aStream ] ] ].
	aStream nextPutAll: ']'
]

{ #category : 'accessing' }
FamixCSArrayReference >> size [

	<FMProperty: #size type: #Number>
	<generated>
	^ size
]

{ #category : 'accessing' }
FamixCSArrayReference >> size: anObject [
	<generated>
	size := anObject
]
