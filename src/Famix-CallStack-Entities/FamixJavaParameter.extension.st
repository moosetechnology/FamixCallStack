Extension { #name : 'FamixJavaParameter' }

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaParameter >> arguments [
	"Relation named: #arguments type: #FamixCSArgument opposite: #parameter"

	<generated>
	<derived>
	<FMProperty: #arguments type: #FamixCSArgument opposite: #parameter>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #parameter: ]
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaParameter >> arguments: anObject [

	<generated>
	self arguments value: anObject
]
