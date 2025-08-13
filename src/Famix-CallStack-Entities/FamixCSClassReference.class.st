"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `field` | `FamixCSClassReference` | `parent` | `FamixCSField` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isPrepared` | `Boolean` | true | |

"
Class {
	#name : 'FamixCSClassReference',
	#superclass : 'FamixCSObjectReference',
	#instVars : [
		'#field => FMMany type: #FamixCSField opposite: #parent',
		'#isPrepared => FMProperty defaultValue: true'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSClassReference class >> annotation [

	<FMClass: #ClassReference super: #FamixCSObjectReference>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSClassReference >> addField: anObject [
	<generated>
	^ self field add: anObject
]

{ #category : 'accessing' }
FamixCSClassReference >> field [
	"Relation named: #field type: #FamixCSField opposite: #parent"

	<generated>
	<derived>
	^ field
]

{ #category : 'accessing' }
FamixCSClassReference >> field: anObject [

	<generated>
	field value: anObject
]

{ #category : 'accessing' }
FamixCSClassReference >> isPrepared [

	<FMProperty: #isPrepared type: #Boolean defaultValue: true>
	<generated>
	^ isPrepared ifNil: [ isPrepared := true ]
]

{ #category : 'accessing' }
FamixCSClassReference >> isPrepared: anObject [
	<generated>
	isPrepared := anObject
]

{ #category : 'printing' }
FamixCSClassReference >> mooseNameOn: aStream [

	super mooseNameOn: aStream.
	typing ifNil: [ aStream nextPutAll: nil asString ] ifNotNil: [ typing declaredType mooseNameOn: aStream ]
]
