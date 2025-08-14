"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `stackline` | `FamixCSMethodCall` | `methodCall` | `FamixCSStackline` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FamixCSMethodCall` | `parent` | `FamixCSArgument` | |
| `method` | `FamixCSMethodCall` | `methodCalls` | `FamixJavaMethod` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isArgsAccessible` | `Boolean` | true | |

"
Class {
	#name : 'FamixCSMethodCall',
	#superclass : 'FamixCSEntity',
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#arguments => FMMany type: #FamixCSArgument opposite: #parent',
		'#isArgsAccessible => FMProperty defaultValue: true',
		'#stackline => FMOne type: #FamixCSStackline opposite: #methodCall'
	],
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSMethodCall class >> annotation [

	<FMClass: #MethodCall super: #FamixCSEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixCSMethodCall >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : 'accessing' }
FamixCSMethodCall >> arguments [
	"Relation named: #arguments type: #FamixCSArgument opposite: #parent"

	<generated>
	<derived>
	^ arguments
]

{ #category : 'accessing' }
FamixCSMethodCall >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : 'accessing' }
FamixCSMethodCall >> isArgsAccessible [

	<FMProperty: #isArgsAccessible type: #Boolean defaultValue: true>
	<generated>
	^ isArgsAccessible ifNil: [ isArgsAccessible := true ]
]

{ #category : 'accessing' }
FamixCSMethodCall >> isArgsAccessible: anObject [
	<generated>
	isArgsAccessible := anObject
]

{ #category : 'testing' }
FamixCSMethodCall >> isMethodCall [

	^ true
]

{ #category : 'accessing' }
FamixCSMethodCall >> method [
	"Relation named: #method type: #FamixJavaMethod opposite: #methodCalls"

	<generated>
	<FMProperty: #method type: #FamixJavaMethod opposite: #methodCalls>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixCSMethodCall >> method: anObject [

	<generated>
	self attributeAt: #method put: (FMMultivalueLink on: self update: #methodCalls from: self method to: anObject).
]

{ #category : 'accessing' }
FamixCSMethodCall >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #methodCall"

	<generated>
	<container>
	<derived>
	^ stackline
]

{ #category : 'accessing' }
FamixCSMethodCall >> stackline: anObject [

	<generated>
	stackline := anObject
]

{ #category : 'navigation' }
FamixCSMethodCall >> stacklineGroup [
	<generated>
	<navigation: 'Stackline'>
	^ MooseSpecializedGroup with: self stackline
]
