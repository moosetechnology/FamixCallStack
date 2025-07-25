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
	^ self
]

{ #category : 'meta' }
FamixCSEntity class >> metamodel [

	<generated>
	^ FamixCSModel metamodel
]
