"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSArgument` | `arguments` | `FamixCSMethodCall` | |
| `value` | `FamixCSArgument` | `argumentUsages` | `FamixCSValue` | |



"
Class {
	#name : 'FamixCSArgument',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#parent => FMOne type: #FamixCSMethodCall opposite: #arguments',
		'#value => FMOne type: #FamixCSValue opposite: #argumentUsages'
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
FamixCSArgument >> parent [
	"Relation named: #parent type: #FamixCSMethodCall opposite: #arguments"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixCSArgument >> parent: anObject [

	<generated>
	parent := anObject
]

{ #category : 'accessing' }
FamixCSArgument >> value [
	"Relation named: #value type: #FamixCSValue opposite: #argumentUsages"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSArgument >> value: anObject [

	<generated>
	value := anObject
]
