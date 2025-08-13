Extension { #name : 'FamixCSClassReference' }

{ #category : '*Famix-CallStack-Importer' }
FamixCSClassReference >> fillFrom: aCollection reader: aCSReader [

	| fields |
	aCollection isString ifTrue: [
			(aCollection sameAs: '<<CLASS_NOT_PREPARED>>')
				ifTrue: [ ^ self isPrepared: false ]
				ifFalse: [ Error signal: 'Uneccepted String in class refrence import :' , aCollection ] ].

	fields := aCollection at: 'fields'.
	fields collect: [ :fieldDict | aCSReader createField: (fieldDict at: #field) ] thenDo: [ :object | self addField: object ].
	^ self
]
