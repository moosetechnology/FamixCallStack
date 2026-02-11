Extension { #name : 'FamixCSStack' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStack >> indexOfLine: aLine [

	^ stacklines indexOf: aLine
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStack >> mooseNameOn: aStream [

	aStream
		nextPutAll: 'aStack (';
		print: stacklines size;
		nextPutAll: ' stacklines)'
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStack >> nextTo: aStackline [

	<derived>
	<FMComment: 'The line next to the given line in the stack'>
	^ stacklines after: aStackline ifAbsent: [ nil ]
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStack >> previousTo: aStackline [

	<derived>
	<FMComment: 'The line before to the given line in the stack'>
	^ stacklines before: aStackline ifAbsent: [ nil ]
]
