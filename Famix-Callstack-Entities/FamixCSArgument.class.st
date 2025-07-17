"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stackline` | `FamixCSArgument` | `arguments` | `FamixCSStackline` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixCSArgument` | `argumentUsage` | `FamixCSInstance` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `type` | `String` | nil | |

"
Class {
	#name : 'FamixCSArgument',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#stackline => FMOne type: #FamixCSStackline opposite: #arguments',
		'#type => FMProperty',
		'#value => FMOne type: #FamixCSInstance opposite: #argumentUsage'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSArgument class >> annotation [

	<FMClass: #Argument super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSArgument >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #arguments"

	<generated>
	<container>
	^ stackline
]

{ #category : 'accessing' }
FamixCSArgument >> stackline: anObject [

	<generated>
	stackline := anObject
]

{ #category : 'navigation' }
FamixCSArgument >> stacklineGroup [
	<generated>
	<navigation: 'Stackline'>
	^ MooseSpecializedGroup with: self stackline
]

{ #category : 'accessing' }
FamixCSArgument >> type [

	<FMProperty: #type type: #String>
	<generated>
	^ type
]

{ #category : 'accessing' }
FamixCSArgument >> type: anObject [
	<generated>
	type := anObject
]

{ #category : 'accessing' }
FamixCSArgument >> value [
	"Relation named: #value type: #FamixCSInstance opposite: #argumentUsage"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSArgument >> value: anObject [

	<generated>
	value := anObject
]
