Extension { #name : 'FamixCSArgument' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSArgument >> mooseNameOn: aStream [

	self parameter name ifNotNil: [
			aStream
				nextPutAll: self parameter name;
				nextPutAll: ' = ' ].
	self value
		ifNotNil: [ :val | val mooseNameOn: aStream ]
		ifNil: [ aStream print: nil ]
]
