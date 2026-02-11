"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `value` | `Object` | nil | |

"
Class {
	#name : 'FamixCSPrimitiveValue',
	#superclass : 'FamixCSValue',
	#instVars : [
		'#value => FMProperty'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSPrimitiveValue class >> annotation [

	<FMClass: #PrimitiveValue super: #FamixCSValue>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSPrimitiveValue >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSPrimitiveValue >> value: anObject [
	<generated>
	value := anObject
]
