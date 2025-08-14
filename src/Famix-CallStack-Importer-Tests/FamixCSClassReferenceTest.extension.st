Extension { #name : 'FamixCSClassReferenceTest' }

{ #category : '*Famix-CallStack-Importer-Tests' }
FamixCSClassReferenceTest >> testFillFromClassNotPrepared [

	| classReference |
	classReference := reader model newClassReference.
	classReference
		fillFrom: (Dictionary new
				 at: #fields put: { (Dictionary new
						  at: #field put: CSStructureCreator simpleFieldDict;
						  yourself) };
				 yourself)
		reader: reader.
	self assert: classReference fields size equals: 1
]

{ #category : '*Famix-CallStack-Importer-Tests' }
FamixCSClassReferenceTest >> testFillFromDoesAddFields [
	self fail.
]
