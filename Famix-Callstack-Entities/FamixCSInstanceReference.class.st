"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiverUsages` | `FamixCSInstanceReference` | `receiver` | `FamixCSStackline` | |



"
Class {
	#name : 'FamixCSInstanceReference',
	#superclass : 'FamixCSInstance',
	#instVars : [
		'#receiverUsages => FMMany type: #FamixCSStackline opposite: #receiver'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSInstanceReference class >> annotation [

	<FMClass: #InstanceReference super: #FamixCSInstance>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSInstanceReference >> addReceiverUsage: anObject [
	<generated>
	^ self receiverUsages add: anObject
]

{ #category : 'accessing' }
FamixCSInstanceReference >> receiverUsages [
	"Relation named: #receiverUsages type: #FamixCSStackline opposite: #receiver"

	<generated>
	<derived>
	^ receiverUsages
]

{ #category : 'accessing' }
FamixCSInstanceReference >> receiverUsages: anObject [

	<generated>
	receiverUsages value: anObject
]
