Extension { #name : 'FamixJavaPrimitiveType' }

{ #category : '*Famix-CallStack-Entities-accessing' }
FamixJavaPrimitiveType >> usages [
	"Relation named: #usages type: #FamixCSPrimitiveValue opposite: #type"

	<generated>
	<derived>
	<FMProperty: #usages type: #FamixCSPrimitiveValue opposite: #type>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #usages ifAbsent: [ nil ]
]

{ #category : '*Famix-CallStack-Entities-accessing' }
FamixJavaPrimitiveType >> usages: anObject [

	<generated>
	(self attributeAt: #usages ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self usages.
		self attributeAt: #usages put: anObject.
		otherSide type: nil ]
	ifNotNil: [ 
		self attributeAt: #usages put: anObject.
		anObject type: self ]
]
