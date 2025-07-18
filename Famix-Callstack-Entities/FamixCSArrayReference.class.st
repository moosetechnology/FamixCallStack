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
| `size` | `Object` | nil | |

"
Class {
	#name : 'FamixCSArrayReference',
	#superclass : 'FamixCSObjectReference',
	#instVars : [
		'#size => FMProperty',
		'#elements => FMMany type: #FamixCSArrayValue opposite: #parent'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
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

{ #category : 'accessing' }
FamixCSArrayReference >> size [

	<FMProperty: #size type: #Object>
	<generated>
	^ size
]

{ #category : 'accessing' }
FamixCSArrayReference >> size: anObject [
	<generated>
	size := anObject
]
