Extension { #name : 'FamixCSPrimitiveValue' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSPrimitiveValue >> isPrimitiveValue [

	^ true
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSPrimitiveValue >> mooseNameOn: aStream [

	aStream print: value
]
