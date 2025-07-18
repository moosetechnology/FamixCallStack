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
FamixCSTEntityCreator >> newArrayReference [

	<generated>
	^ self add: FamixCSArrayReference new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newArrayValue [

	<generated>
	^ self add: FamixCSArrayValue new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newClassReference [

	<generated>
	^ self add: FamixCSClassReference new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newEntity [

	<generated>
	^ self add: FamixCSEntity new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newField [

	<generated>
	^ self add: FamixCSField new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newMethodCall [

	<generated>
	^ self add: FamixCSMethodCall new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newObjectReference [

	<generated>
	^ self add: FamixCSObjectReference new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newPrimitiveValue [

	<generated>
	^ self add: FamixCSPrimitiveValue new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newStackline [

	<generated>
	^ self add: FamixCSStackline new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newStringReference [

	<generated>
	^ self add: FamixCSStringReference new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newValue [

	<generated>
	^ self add: FamixCSValue new
]
