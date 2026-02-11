"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fields` | `FamixCSClassReference` | `parent` | `FamixCSField` | |


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
		'#fields => FMMany type: \'AnObsoleteFamixCSField\' opposite: #parent',
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
	^ self fields add: anObject
]

{ #category : 'accessing' }
FamixCSClassReference >> fields [
	"Relation named: #fields type: #FamixCSField opposite: #parent"

	<generated>
	<derived>
	^ fields
]

{ #category : 'accessing' }
FamixCSClassReference >> fields: anObject [

	<generated>
	fields value: anObject
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
