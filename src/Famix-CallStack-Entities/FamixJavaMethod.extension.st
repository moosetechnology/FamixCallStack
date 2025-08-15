Extension { #name : 'FamixJavaMethod' }

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> stacklines [
	"Relation named: #stacklines type: #FamixCSStackline opposite: #method"

	<generated>
	<derived>
	<FMProperty: #stacklines type: #FamixCSStackline opposite: #method>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #stacklines ifAbsentPut: [ FMMultivalueLink on: self opposite: #method: ]
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> stacklines: anObject [

	<generated>
	self stacklines value: anObject
]
