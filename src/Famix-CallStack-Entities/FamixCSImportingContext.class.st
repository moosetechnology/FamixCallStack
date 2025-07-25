"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixCSModel.
"
Class {
	#name : 'FamixCSImportingContext',
	#superclass : 'FamixImportingContext',
	#category : 'Famix-CallStack-Entities-Import',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Import'
}

{ #category : 'accessing' }
FamixCSImportingContext class >> importedMetamodel [

	<generated>
	^ FamixCSModel metamodel
]

{ #category : 'importing' }
FamixCSImportingContext >> importArgument [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Argument)
]

{ #category : 'importing' }
FamixCSImportingContext >> importArrayReference [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ArrayReference)
]

{ #category : 'importing' }
FamixCSImportingContext >> importArrayValue [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ArrayValue)
]

{ #category : 'importing' }
FamixCSImportingContext >> importClassReference [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ClassReference)
]

{ #category : 'importing' }
FamixCSImportingContext >> importEntity [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Entity)
]

{ #category : 'importing' }
FamixCSImportingContext >> importField [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Field)
]

{ #category : 'importing' }
FamixCSImportingContext >> importMethodCall [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #MethodCall)
]

{ #category : 'importing' }
FamixCSImportingContext >> importObjectReference [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ObjectReference)
]

{ #category : 'importing' }
FamixCSImportingContext >> importPrimitiveValue [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PrimitiveValue)
]

{ #category : 'importing' }
FamixCSImportingContext >> importStackline [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Stackline)
]

{ #category : 'importing' }
FamixCSImportingContext >> importStringReference [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #StringReference)
]

{ #category : 'importing' }
FamixCSImportingContext >> importValue [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Value)
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportArgument [

	<generated>
	^ self shouldImport: #Argument
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportArrayReference [

	<generated>
	^ self shouldImport: #ArrayReference
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportArrayValue [

	<generated>
	^ self shouldImport: #ArrayValue
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportClassReference [

	<generated>
	^ self shouldImport: #ClassReference
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportEntity [

	<generated>
	^ self shouldImport: #Entity
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportField [

	<generated>
	^ self shouldImport: #Field
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportMethodCall [

	<generated>
	^ self shouldImport: #MethodCall
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportObjectReference [

	<generated>
	^ self shouldImport: #ObjectReference
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportPrimitiveValue [

	<generated>
	^ self shouldImport: #PrimitiveValue
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportStackline [

	<generated>
	^ self shouldImport: #Stackline
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportStringReference [

	<generated>
	^ self shouldImport: #StringReference
]

{ #category : 'testing' }
FamixCSImportingContext >> shouldImportValue [

	<generated>
	^ self shouldImport: #Value
]
