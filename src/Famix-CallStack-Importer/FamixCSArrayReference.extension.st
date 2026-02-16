Extension { #name : 'FamixCSArrayReference' }

{ #category : '*Famix-CallStack-Importer' }
FamixCSArrayReference >> fillFrom: aCollection reader: aCSReader [

	(aCollection at: 'elements') do: [ :elem | self addElement: (aCSReader createArrayValueWith: elem) ]
]
