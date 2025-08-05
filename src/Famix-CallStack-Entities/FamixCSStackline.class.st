"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stack` | `FamixCSStackline` | `stacklines` | `FamixCSStack` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `methodCall` | `FamixCSStackline` | `stackline` | `FamixCSMethodCall` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiver` | `FamixCSStackline` | `receiverUsages` | `FamixCSObjectReference` | |



"
Class {
	#name : 'FamixCSStackline',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTEntityMetaLevelDependency',
	#classTraits : 'FamixCSTEntityMetaLevelDependency classTrait',
	#instVars : [
		'#methodCall => FMOne type: #FamixCSMethodCall opposite: #stackline',
		'#receiver => FMOne type: #FamixCSObjectReference opposite: #receiverUsages',
		'#stack => FMOne type: #FamixCSStack opposite: #stacklines'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
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

{ #category : 'printing' }
FamixCSStackline >> mooseNameOn: aStream [

	aStream nextPutAll: 'Line ' , self positionInStack asString.
]

{ #category : 'accessing' }
FamixCSStackline >> next [

	<derived>
	<FMComment: 'The next stackline in the stack'>
	<FMProperty: #next type: #FamixCSStackline>
	^ self stack nextTo: self
]

{ #category : 'as yet unclassified' }
FamixCSStackline >> positionInStack [
	
	<FMProperty: #positionInStack type: #Number>
	<derived>
	<FMComment: 'The position of this stack line in the stack'>
	^ self stack stacklines indexOf: self
]

{ #category : 'accessing' }
FamixCSStackline >> previous [

	<derived>
	<FMComment: 'The previous stackline in the stack'>
	<FMProperty: #previous type: #FamixCSStackline>
	^ self stack previousTo: self
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

{ #category : 'accessing' }
FamixCSStackline >> stack [
	"Relation named: #stack type: #FamixCSStack opposite: #stacklines"

	<generated>
	<container>
	^ stack
]

{ #category : 'accessing' }
FamixCSStackline >> stack: anObject [

	<generated>
	stack := anObject
]

{ #category : 'navigation' }
FamixCSStackline >> stackGroup [
	<generated>
	<navigation: 'Stack'>
	^ MooseSpecializedGroup with: self stack
]
