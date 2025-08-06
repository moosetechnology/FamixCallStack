"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stackline` | `FamixCSReceiver` | `receiver` | `FamixCSStackline` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `maxDepthReached` | `Boolean` | false | |
| `unaccessible` | `Boolean` | false | |

"
Class {
	#name : 'FamixCSReceiver',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer',
	#classTraits : 'FamixCSTValueContainer classTrait',
	#instVars : [
		'#stackline => FMOne type: #FamixCSStackline opposite: #receiver'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSReceiver class >> annotation [

	<FMClass: #Receiver super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSReceiver >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #receiver"

	<generated>
	<container>
	<derived>
	^ stackline
]

{ #category : 'accessing' }
FamixCSReceiver >> stackline: anObject [

	<generated>
	stackline := anObject
]

{ #category : 'navigation' }
FamixCSReceiver >> stacklineGroup [
	<generated>
	<navigation: 'Stackline'>
	^ MooseSpecializedGroup with: self stackline
]
