Extension { #name : 'String' }

{ #category : '*Famix-Callstack-Importer' }
String >> isCSAttentionTag [
	"Used in the context of java call stack importing"
	"Returns true iff correspond to a attention tag"
	^ (self beginsWith: '<<' ) & (self endsWith: '>>' )
]
