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
FamixCSTEntityCreator >> newArrayReference [

	<generated>
	^ self add: FamixCSArrayReference new
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
FamixCSTEntityCreator >> newInstance [

	<generated>
	^ self add: FamixCSInstance new
]

{ #category : 'entity creation' }
FamixCSTEntityCreator >> newInstanceReference [

	<generated>
	^ self add: FamixCSInstanceReference new
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
FamixCSTEntityCreator >> newPrimitiveType [

	<generated>
	^ self add: FamixCSPrimitiveType new
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
