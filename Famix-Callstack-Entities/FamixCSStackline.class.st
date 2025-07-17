"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FamixCSStackline` | `stackline` | `FamixCSArgument` | |
| `method` | `FamixCSStackline` | `stackline` | `FamixJavaMethod` | |
| `receiver` | `FamixCSStackline` | `stackline` | `FamixCSReceiver` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixCSStackline` | `previous` | `FamixCSStackline` | |
| `previous` | `FamixCSStackline` | `next` | `FamixCSStackline` | |


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
		'#arguments => FMMany type: #FamixCSArgument opposite: #stackline',
		'#next => FMOne type: #FamixCSStackline opposite: #previous',
		'#number => FMProperty',
		'#previous => FMOne type: #FamixCSStackline opposite: #next',
		'#receiver => FMOne type: #FamixCSReceiver opposite: #stackline'
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

{ #category : 'adding' }
FamixCSStackline >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : 'accessing' }
FamixCSStackline >> arguments [
	"Relation named: #arguments type: #FamixCSArgument opposite: #stackline"

	<generated>
	<derived>
	^ arguments
]

{ #category : 'accessing' }
FamixCSStackline >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : 'navigation' }
FamixCSStackline >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseSpecializedGroup withAll: self arguments asSet
]

{ #category : 'accessing' }
FamixCSStackline >> method [
	"Relation named: #method type: #FamixJavaMethod opposite: #stackline"

	<generated>
	<FMProperty: #method type: #FamixJavaMethod opposite: #stackline>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixCSStackline >> method: anObject [

	<generated>
	(self attributeAt: #method ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self method.
		self attributeAt: #method put: anObject.
		otherSide stackline: nil ]
	ifNotNil: [ 
		self attributeAt: #method put: anObject.
		anObject stackline: self ]
]

{ #category : 'navigation' }
FamixCSStackline >> methodGroup [
	<generated>
	<navigation: 'Method'>
	^ MooseSpecializedGroup with: self method
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
	"Relation named: #receiver type: #FamixCSReceiver opposite: #stackline"

	<generated>
	^ receiver
]

{ #category : 'accessing' }
FamixCSStackline >> receiver: anObject [

	<generated>
	receiver := anObject
]

{ #category : 'navigation' }
FamixCSStackline >> receiverGroup [
	<generated>
	<navigation: 'Receiver'>
	^ MooseSpecializedGroup with: self receiver
]
