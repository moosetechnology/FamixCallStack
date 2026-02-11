Extension { #name : 'FamixCSStringReference' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStringReference >> isStringReference [

	^ true
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStringReference >> mooseNameOn: aStream [

	aStream print: value
]
