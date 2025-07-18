"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `methodCall` | `FamixCSStackline` | `stackline` | `FamixCSMethodCall` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixCSStackline` | `previous` | `FamixCSStackline` | |
| `previous` | `FamixCSStackline` | `next` | `FamixCSStackline` | |
| `receiver` | `FamixCSStackline` | `receiverUsages` | `FamixCSObjectReference` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `number` | `Object` | nil | |

"
Class {
	#name : 'FamixCSStackline',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#number => FMProperty',
		'#methodCall => FMOne type: #FamixCSMethodCall opposite: #stackline',
		'#receiver => FMOne type: #FamixCSObjectReference opposite: #receiverUsages',
		'#previous => FMOne type: #FamixCSStackline opposite: #next',
		'#next => FMOne type: #FamixCSStackline opposite: #previous'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSStackline class >> annotation [

	<FMClass: #Stackline super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSStackline >> methodCall [
	"Relation named: #methodCall type: #FamixCSMethodCall opposite: #stackline"

	<generated>
	^ methodCall
]

{ #category : 'accessing' }
FamixCSStackline >> methodCall: anObject [

	<generated>
	methodCall := anObject
]

{ #category : 'navigation' }
FamixCSStackline >> methodCallGroup [
	<generated>
	<navigation: 'MethodCall'>
	^ MooseSpecializedGroup with: self methodCall
]

{ #category : 'accessing' }
FamixCSStackline >> next [
	"Relation named: #next type: #FamixCSStackline opposite: #previous"

	<generated>
	<derived>
	^ next
]

{ #category : 'accessing' }
FamixCSStackline >> next: anObject [

	<generated>
	next := anObject
]

{ #category : 'accessing' }
FamixCSStackline >> number [

	<FMProperty: #number type: #Object>
	<generated>
	^ number
]

{ #category : 'accessing' }
FamixCSStackline >> number: anObject [
	<generated>
	number := anObject
]

{ #category : 'accessing' }
FamixCSStackline >> previous [
	"Relation named: #previous type: #FamixCSStackline opposite: #next"

	<generated>
	^ previous
]

{ #category : 'accessing' }
FamixCSStackline >> previous: anObject [

	<generated>
	previous := anObject
]

{ #category : 'accessing' }
FamixCSStackline >> receiver [
	"Relation named: #receiver type: #FamixCSObjectReference opposite: #receiverUsages"

	<generated>
	^ receiver
]

{ #category : 'accessing' }
FamixCSStackline >> receiver: anObject [

	<generated>
	receiver := anObject
]
