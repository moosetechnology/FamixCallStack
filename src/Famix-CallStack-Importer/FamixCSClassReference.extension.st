Extension { #name : 'FamixCSClassReference' }

{ #category : '*Famix-CallStack-Importer' }
FamixCSClassReference >> fillFrom: aCollection reader: aCSReader [

	| fields |
	
	aCollection isString ifTrue: [
			(aCollection sameAs: '<<CLASS_NOT_PREPARED>>')
				ifTrue: [ ^ self prepared: false ]
				ifFalse: [ Error signal: 'Uneccepted String in class refrence import :' , aCollection ] ].
	
	fields := aCollection at: 'fields'.
	fields
		collect: [ :fieldDict |
				fieldDict isCSAttentionTag
					ifTrue: [
							(fieldDict sameAs: '<<INACCESSIBLE>>')
								ifTrue: [ aCSReader createInaccessibleField ]
								ifFalse: [ Error signal: 'unhandled attention tag : ' , fieldDict ] ]
					ifFalse: [ aCSReader createField: (fieldDict at: #field) ] ]
		thenDo: [ :object | self addField: object ].
	^ self
]
