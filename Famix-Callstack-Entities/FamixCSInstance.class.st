"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arrayUsages` | `FamixCSInstance` | `elements` | `FamixCSArrayReference` | |
| `fields` | `FamixCSInstance` | `instance` | `FamixCSField` | |
| `methodUsages` | `FamixCSInstance` | `arguments` | `FamixCSMethodCall` | |


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
		'#uniqueID => FMProperty',
		'#type => FMProperty',
		'#methodUsages => FMMany type: #FamixCSMethodCall opposite: #arguments',
		'#arrayUsages => FMMany type: #FamixCSArrayReference opposite: #elements',
		'#fields => FMMany type: #FamixCSField opposite: #instance'
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
FamixCSInstance >> addArrayUsage: anObject [
	<generated>
	^ self arrayUsages add: anObject
]

{ #category : 'adding' }
FamixCSInstance >> addField: anObject [
	<generated>
	^ self fields add: anObject
]

{ #category : 'adding' }
FamixCSInstance >> addMethodUsage: anObject [
	<generated>
	^ self methodUsages add: anObject
]

{ #category : 'accessing' }
FamixCSInstance >> arrayUsages [
	"Relation named: #arrayUsages type: #FamixCSArrayReference opposite: #elements"

	<generated>
	^ arrayUsages
]

{ #category : 'accessing' }
FamixCSInstance >> arrayUsages: anObject [

	<generated>
	arrayUsages value: anObject
]

{ #category : 'accessing' }
FamixCSInstance >> fields [
	"Relation named: #fields type: #FamixCSField opposite: #instance"

	<generated>
	<derived>
	^ fields
]

{ #category : 'accessing' }
FamixCSInstance >> fields: anObject [

	<generated>
	fields value: anObject
]

{ #category : 'accessing' }
FamixCSInstance >> methodUsages [
	"Relation named: #methodUsages type: #FamixCSMethodCall opposite: #arguments"

	<generated>
	^ methodUsages
]

{ #category : 'accessing' }
FamixCSInstance >> methodUsages: anObject [

	<generated>
	methodUsages value: anObject
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
