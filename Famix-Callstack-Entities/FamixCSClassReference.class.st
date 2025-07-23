"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `field` | `FamixCSClassReference` | `parent` | `FamixCSField` | |



"
Class {
	#name : 'FamixCSClassReference',
	#superclass : 'FamixCSObjectReference',
	#instVars : [
		'#field => FMMany type: #FamixCSField opposite: #parent'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
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

{ #category : 'printing' }
FamixCSClassReference >> mooseNameOn: aStream [
	super mooseNameOn: aStream.
	aStream nextPutAll: type asString.
]
