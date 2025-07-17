Extension { #name : 'FamixJavaParameter' }

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaParameter >> method [
	"Relation named: #method type: #FamixJavaMethod opposite: #parameters"

	<generated>
	<container>
	<FMProperty: #method type: #FamixJavaMethod opposite: #parameters>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaParameter >> method: anObject [

	<generated>
	self attributeAt: #method put: (FMMultivalueLink on: self update: #parameters from: self method to: anObject).
]
