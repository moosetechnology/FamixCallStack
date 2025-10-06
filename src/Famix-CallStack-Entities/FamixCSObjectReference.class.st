"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `uniqueID` | `Number` | nil | |

"
Class {
	#name : 'FamixCSObjectReference',
	#superclass : 'FamixCSValue',
	#instVars : [
		'#uniqueID => FMProperty'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSObjectReference class >> annotation [

	<FMClass: #ObjectReference super: #FamixCSValue>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSObjectReference >> fillFrom: aCollection reader: aCSReader [

	self subclassResponsibility 
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
