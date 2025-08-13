Extension { #name : 'FamixCSField' }

{ #category : '*Famix-CallStack-Importer' }
FamixCSField >> fillFrom: aCollection reader: aCallStackJsonReader [ 
	
	self name: (aCollection at: #name).
	"If no precision on accessibility by default we consider it accessible"
	aCollection at: #accessible ifPresent: [ :bool | self accessible: bool ].
	aCollection at: #value ifPresent: [ :valueCol | aCallStackJsonReader fillValueCheckingMaxDepthOn: self with: valueCol].
]
