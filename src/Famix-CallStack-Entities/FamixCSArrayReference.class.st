"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FamixCSArrayReference` | `parent` | `FamixCSArrayValue` | |



"
Class {
	#name : 'FamixCSArrayReference',
	#superclass : 'FamixCSObjectReference',
	#instVars : [
		'#elements => FMMany type: #FamixCSArrayValue opposite: #parent'
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
