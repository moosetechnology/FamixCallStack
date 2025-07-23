Class {
	#name : 'FamixCSEntity',
	#superclass : 'MooseEntity',
	#category : 'Famix-Callstack-Entities-Entities',
	#package : 'Famix-Callstack-Entities',
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
