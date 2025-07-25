"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `type` | `FamixCSPrimitiveValue` | `usages` | `FamixJavaPrimitiveType` | |


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

{ #category : 'printing' }
FamixCSPrimitiveValue >> mooseNameOn: aStream [

	self type mooseNameOn: aStream.
	aStream nextPutAll: ' : ' , value asString.
	
]

{ #category : 'accessing' }
FamixCSPrimitiveValue >> type [
	"Relation named: #type type: #FamixJavaPrimitiveType opposite: #usages"

	<generated>
	<FMProperty: #type type: #FamixJavaPrimitiveType opposite: #usages>
	^ self attributeAt: #type ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixCSPrimitiveValue >> type: anObject [

	<generated>
	(self attributeAt: #type ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self type.
		self attributeAt: #type put: anObject.
		otherSide usages: nil ]
	ifNotNil: [ 
		self attributeAt: #type put: anObject.
		anObject usages: self ]
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
