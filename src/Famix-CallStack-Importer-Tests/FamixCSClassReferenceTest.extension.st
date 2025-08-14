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

	| classReference |
	classReference := reader model newClassReference.
	classReference fillFrom: '<<CLASS_NOT_PREPARED>>' reader: reader.
	self assert: classReference fields size equals: 0.
	self assert: classReference isPrepared not
]
