Class {
	#name : 'FamixCSModel',
	#superclass : 'MooseModel',
	#traits : 'FamixCSTEntityCreator + FamixJavaTEntityCreator',
	#classTraits : 'FamixCSTEntityCreator classTrait + FamixJavaTEntityCreator classTrait',
	#category : 'Famix-Callstack-Entities-Model',
	#package : 'Famix-Callstack-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixCSModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'Famix-Java-Entities')
]

{ #category : 'meta' }
FamixCSModel class >> annotation [
	<FMClass: #FamixCSModel super: #MooseModel>
	<package: #'Famix-Callstack-Entities'>
	<generated>
]
