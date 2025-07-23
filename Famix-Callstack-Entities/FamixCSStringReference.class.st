"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `value` | `String` | nil | |

"
Class {
	#name : 'FamixCSStringReference',
	#superclass : 'FamixCSObjectReference',
	#instVars : [
		'#value => FMProperty'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSStringReference class >> annotation [

	<FMClass: #StringReference super: #FamixCSObjectReference>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'printing' }
FamixCSStringReference >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream print: value
]

{ #category : 'accessing' }
FamixCSStringReference >> value [

	<FMProperty: #value type: #String>
	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSStringReference >> value: anObject [
	<generated>
	value := anObject
]
