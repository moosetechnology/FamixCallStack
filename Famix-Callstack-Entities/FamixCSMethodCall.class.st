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
| `arguments` | `FamixCSMethodCall` | `parent` | `FamixCSArgument` | |
| `method` | `FamixCSMethodCall` | `methodCalls` | `FamixJavaMethod` | |



"
Class {
	#name : 'FamixCSMethodCall',
	#superclass : 'FamixCSEntity',
	#instVars : [
		'#stackline => FMOne type: #FamixCSStackline opposite: #methodCall',
		'#arguments => FMMany type: #FamixCSArgument opposite: #parent'
	],
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
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
