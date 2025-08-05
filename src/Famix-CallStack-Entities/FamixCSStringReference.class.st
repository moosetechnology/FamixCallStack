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
	#traits : 'FamixCSTEntityMetaLevelDependency',
	#classTraits : 'FamixCSTEntityMetaLevelDependency classTrait',
	#instVars : [
		'#value => FMProperty'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
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
