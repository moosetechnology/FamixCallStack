Extension { #name : 'FamixCSStringReferenceTest' }

{ #category : '*Famix-CallStack-Importer-Tests' }
FamixCSStringReferenceTest >> testFillFromDoesAddElements [

	| stringReference value |
	value := #imAString.
	stringReference := reader model newStringReference.
	stringReference fillFrom: value reader: reader.
	
	self assert: stringReference value equals: value
]
