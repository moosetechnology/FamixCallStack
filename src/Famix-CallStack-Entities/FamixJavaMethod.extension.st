Extension { #name : 'FamixJavaMethod' }

{ #category : '*Famix-CallStack-Entities' }
FamixJavaMethod >> isStatic [

	<FMProperty: #isStatic type: #Boolean>
	<derived>
	^ isStatic
]

{ #category : '*Famix-CallStack-Entities' }
FamixJavaMethod >> isStatic: anObject [
	<derived>
	self flag:#todo. "When importing the model isStatic is not a variable known bye FamixJavaMethod"
	isStatic := anObject 
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> methodCalls [
	"Relation named: #methodCalls type: #FamixCSMethodCall opposite: #method"

	<generated>
	<derived>
	<FMProperty: #methodCalls type: #FamixCSMethodCall opposite: #method>
	<package: #'Famix-Callstack-Entities'>
	^ self attributeAt: #methodCalls ifAbsentPut: [ FMMultivalueLink on: self opposite: #method: ]
]

{ #category : '*Famix-Callstack-Entities-accessing' }
FamixJavaMethod >> methodCalls: anObject [

	<generated>
	self methodCalls value: anObject
]
