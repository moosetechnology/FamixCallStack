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
| `receiver` | `FamixCSStackline` | `stackline` | `FamixCSReceiver` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FamixCSStackline` | `parent` | `FamixCSArgument` | |
| `method` | `FamixCSStackline` | `stacklines` | `FamixJavaMethod` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isArgsAccessible` | `Boolean` | true | |

"
Class {
	#name : 'FamixCSStackline',
	#superclass : 'FamixCSEntity',
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#arguments => FMMany type: #FamixCSArgument opposite: #parent',
		'#isArgsAccessible => FMProperty defaultValue: true',
		'#receiver => FMOne type: #FamixCSReceiver opposite: #stackline',
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

{ #category : 'adding' }
FamixCSStackline >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : 'accessing' }
FamixCSStackline >> arguments [
	"Relation named: #arguments type: #FamixCSArgument opposite: #parent"

	<generated>
	<derived>
	^ arguments
]

{ #category : 'accessing' }
FamixCSStackline >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : 'accessing' }
FamixCSStackline >> isArgsAccessible [

	<FMProperty: #isArgsAccessible type: #Boolean defaultValue: true>
	<generated>
	^ isArgsAccessible ifNil: [ isArgsAccessible := true ]
]

{ #category : 'accessing' }
FamixCSStackline >> isArgsAccessible: anObject [
	<generated>
	isArgsAccessible := anObject
]

{ #category : 'testing' }
FamixCSStackline >> isStackline [

	^ true
]

{ #category : 'accessing' }
FamixCSStackline >> method [
	"Relation named: #method type: #FamixJavaMethod opposite: #stacklines"

	<generated>
	<FMProperty: #method type: #FamixJavaMethod opposite: #stacklines>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixCSStackline >> method: anObject [

	<generated>
	self attributeAt: #method put: (FMMultivalueLink on: self update: #stacklines from: self method to: anObject).
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
	^ stack ifNotNil:[ stack indexOfLine: self].
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
