Class {
	#name : 'FamixCSEntity',
	#superclass : 'MooseEntity',
	#category : 'Famix-CallStack-Entities-Entities',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixCSEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixCSEntity class >> isAbstract [

	<generated>
	^ self == FamixCSEntity
]

{ #category : 'meta' }
FamixCSEntity class >> metamodel [

	<generated>
	^ FamixCSModel metamodel
]

{ #category : 'testing' }
FamixCSEntity >> isArgument [

	^ false
]

{ #category : 'testing' }
FamixCSEntity >> isArrayReference [

	^ false
]

{ #category : 'testing' }
FamixCSEntity >> isClassReference [

	^ false
]

{ #category : 'testing' }
FamixCSEntity >> isField [

	^ false
]

{ #category : 'testing' }
FamixCSEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixCSEntity >> isStackline [

	^ false
]

{ #category : 'testing' }
FamixCSEntity >> isStringReference [

	^ false
]
