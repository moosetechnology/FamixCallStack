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

{ #category : 'testing' }
FamixCSPrimitiveValue >> isPrimitiveValue [

	^ true
]

{ #category : 'printing' }
FamixCSPrimitiveValue >> mooseNameOn: aStream [

	typing ifNotNil: [
			typing declaredType mooseNameOn: aStream.
			aStream nextPutAll: ' : ' ].
	aStream nextPutAll: value asString
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
