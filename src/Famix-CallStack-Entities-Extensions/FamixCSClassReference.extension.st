Extension { #name : 'FamixCSClassReference' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSClassReference >> isClassReference [

	^ true
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSClassReference >> mooseNameOn: aStream [

	typing
		ifNil: [ aStream print: nil ]
		ifNotNil: [ typing declaredType mooseNameOn: aStream ]
]
