"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FamixCSStackline` | `stackline` | `FamixCSArgument` | |
| `method` | `FamixCSStackline` | `stackline` | `FamixCSMethod` | |
| `receiver` | `FamixCSStackline` | `stackline` | `FamixCSReceiver` | |



"
Class {
	#name : 'FamixCSStackline',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#arguments => FMMany type: #FamixCSArgument opposite: #stackline',
		'#receiver => FMOne type: #FamixCSReceiver opposite: #stackline',
		'#method => FMOne type: #FamixCSMethod opposite: #stackline'
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
	"Relation named: #method type: #FamixCSMethod opposite: #stackline"

	<generated>
	^ method
]

{ #category : 'accessing' }
FamixCSStackline >> method: anObject [

	<generated>
	method := anObject
]

{ #category : 'navigation' }
FamixCSStackline >> methodGroup [
	<generated>
	<navigation: 'Method'>
	^ MooseSpecializedGroup with: self method
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
