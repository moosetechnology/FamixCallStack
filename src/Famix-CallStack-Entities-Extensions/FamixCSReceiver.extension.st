Extension { #name : 'FamixCSReceiver' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSReceiver >> isReceiver [

	^ true
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSReceiver >> mooseNameOn: aStream [

	self value
		ifNil: [ aStream print: nil ]
		ifNotNil: [ self value mooseNameOn: aStream ]
]
