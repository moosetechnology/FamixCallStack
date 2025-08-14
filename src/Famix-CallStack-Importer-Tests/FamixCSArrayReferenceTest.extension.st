Extension { #name : 'FamixCSArrayReferenceTest' }

{ #category : '*Famix-CallStack-Importer-Tests' }
FamixCSArrayReferenceTest >> testFillFromDoesAddElements [

	| arrayReference |
	arrayReference := reader model newArrayReference.
	arrayReference
		fillFrom: (Dictionary new
				 at: #elements put: { CSStructureCreator simplePrimitiveValueDict };
				 yourself)
		reader: reader.
	self assert: arrayReference elements size equals: 1
]
