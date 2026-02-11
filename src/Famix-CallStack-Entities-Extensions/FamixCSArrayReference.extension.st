Extension { #name : 'FamixCSArrayReference' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSArrayReference >> isArrayReference [

	^ true
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSArrayReference >> mooseNameOn: aStream [

	aStream nextPutAll: ' ['.
	elements
		do: [ :elem | elem mooseNameOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ']'
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSArrayReference >> size [

	<FMProperty: #size type: #Number>
	<derived>
	^ elements size
]
