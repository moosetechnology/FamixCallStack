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
| `prepared` | `Boolean` | true | |

"
Class {
	#name : 'FamixCSClassReference',
	#superclass : 'FamixCSObjectReference',
	#instVars : [
		'#field => FMMany type: #FamixCSField opposite: #parent',
		'#prepared => FMProperty defaultValue: true'
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

{ #category : 'printing' }
FamixCSClassReference >> mooseNameOn: aStream [

	super mooseNameOn: aStream.
	typing ifNil: [ aStream nextPutAll: nil asString ] ifNotNil: [ typing declaredType mooseNameOn: aStream ]
]

{ #category : 'accessing' }
FamixCSClassReference >> prepared [

	<FMProperty: #prepared type: #Boolean defaultValue: true>
	<generated>
	^ prepared ifNil: [ prepared := true ]
]

{ #category : 'accessing' }
FamixCSClassReference >> prepared: anObject [
	<generated>
	prepared := anObject
]
