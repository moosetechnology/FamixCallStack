"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `instances` | `FamixCSObjectReference` | `objectReference` | `FamixCSInstance` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiverUsage` | `FamixCSObjectReference` | `value` | `FamixCSReceiver` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `fields` | `Object` | nil | |

"
Class {
	#name : 'FamixCSObjectReference',
	#superclass : 'FamixCSInstance',
	#instVars : [
		'#fields => FMProperty',
		'#instances => FMMany type: #FamixCSInstance opposite: #objectReference',
		'#receiverUsage => FMOne type: #FamixCSReceiver opposite: #value'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSObjectReference class >> annotation [

	<FMClass: #ObjectReference super: #FamixCSInstance>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSObjectReference >> addInstance: anObject [
	<generated>
	^ self instances add: anObject
]

{ #category : 'accessing' }
FamixCSObjectReference >> fields [

	<FMProperty: #fields type: #Object>
	<generated>
	^ fields
]

{ #category : 'accessing' }
FamixCSObjectReference >> fields: anObject [
	<generated>
	fields := anObject
]

{ #category : 'accessing' }
FamixCSObjectReference >> instances [
	"Relation named: #instances type: #FamixCSInstance opposite: #objectReference"

	<generated>
	<derived>
	^ instances
]

{ #category : 'accessing' }
FamixCSObjectReference >> instances: anObject [

	<generated>
	instances value: anObject
]

{ #category : 'navigation' }
FamixCSObjectReference >> instancesGroup [
	<generated>
	<navigation: 'Instances'>
	^ MooseSpecializedGroup withAll: self instances asSet
]

{ #category : 'accessing' }
FamixCSObjectReference >> receiverUsage [
	"Relation named: #receiverUsage type: #FamixCSReceiver opposite: #value"

	<generated>
	<derived>
	^ receiverUsage
]

{ #category : 'accessing' }
FamixCSObjectReference >> receiverUsage: anObject [

	<generated>
	receiverUsage := anObject
]
