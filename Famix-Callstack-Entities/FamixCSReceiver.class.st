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
| `value` | `FamixCSReceiver` | `receiverUsage` | `FamixCSObjectReference` | |



"
Class {
	#name : 'FamixCSReceiver',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#stackline => FMOne type: #FamixCSStackline opposite: #receiver',
		'#value => FMOne type: #FamixCSObjectReference opposite: #receiverUsage'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
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

{ #category : 'accessing' }
FamixCSReceiver >> value [
	"Relation named: #value type: #FamixCSObjectReference opposite: #receiverUsage"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSReceiver >> value: anObject [

	<generated>
	value := anObject
]
