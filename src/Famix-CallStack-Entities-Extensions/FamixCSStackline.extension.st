Extension { #name : 'FamixCSStackline' }

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStackline >> mooseNameOn: aStream [

	aStream
		nextPutAll: 'Line ';
		nextPutAll: self positionInStack asString;
		nextPutAll: ' : ';
		nextPutAll: self method parentType name;
		nextPut: $.;
		nextPutAll: self method signature
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStackline >> next [

	<derived>
	<FMComment: 'The next stackline in the stack'>
	<FMProperty: #next type: #FamixCSStackline>
	^ self stack nextTo: self
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStackline >> positionInStack [
	
	<FMProperty: #positionInStack type: #Number>
	<derived>
	<FMComment: 'The position of this stack line in the stack'>
	^ stack ifNotNil:[ stack indexOfLine: self].
]

{ #category : '*Famix-CallStack-Entities-Extensions' }
FamixCSStackline >> previous [

	<derived>
	<FMComment: 'The previous stackline in the stack'>
	<FMProperty: #previous type: #FamixCSStackline>
	^ self stack previousTo: self
]
