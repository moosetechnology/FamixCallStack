"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixCSTEntityCreator',
	#category : 'Famix-Callstack-Entities-Model',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixCSTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newArgument [

	<generated>
	^ self add: FamixCSArgument new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newEntity [

	<generated>
	^ self add: FamixCSEntity new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newMethod [

	<generated>
	^ self add: FamixCSMethod new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newReceiver [

	<generated>
	^ self add: FamixCSReceiver new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newStackline [

	<generated>
	^ self add: FamixCSStackline new
]
