Extension { #name : 'FamixCSArrayValue' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSArrayValue >> mooseNameOn: aStream [

	value ifNil: [ aStream print: nil ] ifNotNil: [ value mooseNameOn: aStream ]
]
