"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiverUsages` | `FamixCSObjectReference` | `receiver` | `FamixCSStackline` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `type` | `String` | nil | |
| `uniqueID` | `Number` | nil | |

"
Class {
	#name : 'FamixCSObjectReference',
	#superclass : 'FamixCSValue',
	#instVars : [
		'#type => FMProperty',
		'#uniqueID => FMProperty',
		'#receiverUsages => FMMany type: #FamixCSStackline opposite: #receiver'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSObjectReference class >> annotation [

	<FMClass: #ObjectReference super: #FamixCSValue>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSObjectReference >> addReceiverUsage: anObject [
	<generated>
	^ self receiverUsages add: anObject
]

{ #category : 'printing' }
FamixCSObjectReference >> mooseNameOn: aStream [

	aStream nextPutAll: '[' , uniqueID asString , '] : '
]

{ #category : 'accessing' }
FamixCSObjectReference >> receiverUsages [
	"Relation named: #receiverUsages type: #FamixCSStackline opposite: #receiver"

	<generated>
	<derived>
	^ receiverUsages
]

{ #category : 'accessing' }
FamixCSObjectReference >> receiverUsages: anObject [

	<generated>
	receiverUsages value: anObject
]

{ #category : 'accessing' }
FamixCSObjectReference >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : 'accessing' }
FamixCSObjectReference >> type: anObject [
	<generated>
	type := anObject
]

{ #category : 'accessing' }
FamixCSObjectReference >> uniqueID [

	<FMProperty: #uniqueID type: #Number>
	<generated>
	^ uniqueID
]

{ #category : 'accessing' }
FamixCSObjectReference >> uniqueID: anObject [
	<generated>
	uniqueID := anObject
]
