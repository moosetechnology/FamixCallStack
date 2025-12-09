"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameter` | `FamixCSArgument` | `arguments` | `FamixJavaParameter` | |
| `parent` | `FamixCSArgument` | `arguments` | `FamixCSStackline` | |
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |



"
Class {
	#name : 'FamixCSArgument',
	#superclass : 'FamixCSEntity',
	#traits : 'FamixCSTValueContainer',
	#classTraits : 'FamixCSTValueContainer classTrait',
	#instVars : [
		'#parent => FMOne type: #FamixCSStackline opposite: #arguments'
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

{ #category : 'testing' }
FamixCSArgument >> isArgument [ 
	^ true.
]

{ #category : 'printing' }
FamixCSArgument >> mooseNameOn: aStream [

	self parameter name ifNotNil: [
			aStream
				nextPutAll: self parameter name;
				nextPutAll: ' = ' ].
	self value
		ifNotNil: [ :val | val mooseNameOn: aStream ]
		ifNil: [ aStream print: nil ]
]

{ #category : 'accessing' }
FamixCSArgument >> parameter [
	"Relation named: #parameter type: #FamixJavaParameter opposite: #arguments"

	<generated>
	<FMProperty: #parameter type: #FamixJavaParameter opposite: #arguments>
	^ self attributeAt: #parameter ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixCSArgument >> parameter: anObject [

	<generated>
	self attributeAt: #parameter put: (FMMultivalueLink on: self update: #arguments from: self parameter to: anObject).
]

{ #category : 'accessing' }
FamixCSArgument >> parent [
	"Relation named: #parent type: #FamixCSStackline opposite: #arguments"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixCSArgument >> parent: anObject [

	<generated>
	parent := anObject
]
