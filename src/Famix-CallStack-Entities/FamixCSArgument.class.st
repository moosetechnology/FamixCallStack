"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixCSArgument` | `arguments` | `FamixCSMethodCall` | |
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `maxDepthReached` | `Boolean` | false | |

"
Class {
	#name : 'FamixCSArgument',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer',
	#classTraits : 'FamixCSTValueContainer classTrait',
	#instVars : [
		'#parent => FMOne type: #FamixCSMethodCall opposite: #arguments'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSArgument class >> annotation [

	<FMClass: #Argument super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'printing' }
FamixCSArgument >> mooseNameOn: aStream [
	self flag: #todo. "how to print? we don't know to which one of the method parameter this argument correspond"
	super mooseNameOn: aStream.
	
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
