Extension { #name : 'FamixJavaMethod' }

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> parameters [
	"Relation named: #parameters type: #FamixJavaParameter opposite: #method"

	<generated>
	<derived>
	<FMProperty: #parameters type: #FamixJavaParameter opposite: #method>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #parameters ifAbsentPut: [ FMMultivalueLink on: self opposite: #method: ]
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> parameters: anObject [

	<generated>
	self parameters value: anObject
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> stackline [
	"Relation named: #stackline type: #FamixCSStackline opposite: #method"

	<generated>
	<container>
	<derived>
	<FMProperty: #stackline type: #FamixCSStackline opposite: #method>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #stackline ifAbsent: [ nil ]
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> stackline: anObject [

	<generated>
	(self attributeAt: #stackline ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self stackline.
		self attributeAt: #stackline put: anObject.
		otherSide method: nil ]
	ifNotNil: [ 
		self attributeAt: #stackline put: anObject.
		anObject method: self ]
]
