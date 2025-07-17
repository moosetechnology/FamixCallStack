"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `objectReference` | `FamixCSInstance` | `instances` | `FamixCSObjectReference` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `argumentUsage` | `FamixCSInstance` | `value` | `FamixCSArgument` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `type` | `String` | nil | |
| `uniqueID` | `Object` | nil | |

"
Class {
	#name : 'FamixCSInstance',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#argumentUsage => FMMany type: #FamixCSArgument opposite: #value',
		'#objectReference => FMOne type: #FamixCSObjectReference opposite: #instances',
		'#type => FMProperty',
		'#uniqueID => FMProperty'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSInstance class >> annotation [

	<FMClass: #Instance super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSInstance >> addArgumentUsage: anObject [
	<generated>
	^ self argumentUsage add: anObject
]

{ #category : 'accessing' }
FamixCSInstance >> argumentUsage [
	"Relation named: #argumentUsage type: #FamixCSArgument opposite: #value"

	<generated>
	<derived>
	^ argumentUsage
]

{ #category : 'accessing' }
FamixCSInstance >> argumentUsage: anObject [

	<generated>
	argumentUsage value: anObject
]

{ #category : 'accessing' }
FamixCSInstance >> objectReference [
	"Relation named: #objectReference type: #FamixCSObjectReference opposite: #instances"

	<generated>
	<container>
	^ objectReference
]

{ #category : 'accessing' }
FamixCSInstance >> objectReference: anObject [

	<generated>
	objectReference := anObject
]

{ #category : 'navigation' }
FamixCSInstance >> objectReferenceGroup [
	<generated>
	<navigation: 'ObjectReference'>
	^ MooseSpecializedGroup with: self objectReference
]

{ #category : 'accessing' }
FamixCSInstance >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : 'accessing' }
FamixCSInstance >> type: anObject [
	<generated>
	type := anObject
]

{ #category : 'accessing' }
FamixCSInstance >> uniqueID [

	<FMProperty: #uniqueID type: #Object>
	<generated>
	^ uniqueID
]

{ #category : 'accessing' }
FamixCSInstance >> uniqueID: anObject [
	<generated>
	uniqueID := anObject
]
