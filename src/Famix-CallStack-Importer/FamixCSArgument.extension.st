Extension { #name : 'FamixCSArgument' }

{ #category : '*Famix-CallStack-Importer' }
FamixCSArgument >> fillFrom: aCollection reader: aCallStackJsonReader [ 

	aCollection ifNotNil: [ self value: (aCallStackJsonReader createValueWith: aCollection) ].
]
