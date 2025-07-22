"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixCSModel.
"
Class {
	#name : 'FamixCSImportingContext',
	#superclass : 'FamixImportingContext',
	#category : 'Famix-Callstack-Entities-Import',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Import'
}

{ #category : 'accessing' }
FamixCSImportingContext class >> importedMetamodel [

	<generated>
	^ FamixCSModel metamodel
]
