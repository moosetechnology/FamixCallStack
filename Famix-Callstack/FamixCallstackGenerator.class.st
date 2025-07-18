Class {
	#name : 'FamixCallstackGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'stackline',
		'entity',
		'parameter',
		'method',
		'instance',
		'primitiveType',
		'methodCall',
		'instanceReference',
		'objectReference',
		'arrayReference',
		'stringReference',
		'field'
	],
	#category : 'Famix-Callstack',
	#package : 'Famix-Callstack'
}

{ #category : 'accessing' }
FamixCallstackGenerator class >> packageName [

    ^ #'Famix-Callstack-Entities'
]

{ #category : 'accessing' }
FamixCallstackGenerator class >> prefix [

    ^ #'FamixCS'
]

{ #category : 'accessing' }
FamixCallstackGenerator class >> submetamodels [
	^ {FamixJavaGenerator}
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineClasses [

	super defineClasses.

	entity := builder newClassNamed: #Entity.
	stackline := builder newClassNamed: #Stackline.
	methodCall := builder newClassNamed: #MethodCall.
	
	instance := builder newClassNamed: #Instance.
	primitiveType := builder newClassNamed: #PrimitiveType.
	instanceReference := builder newClassNamed: #InstanceReference.
	objectReference := builder newClassNamed: #ObjectReference.
	arrayReference := builder newClassNamed: #ArrayReference.
	stringReference := builder newClassNamed: #StringReference.
	
	field := builder newClassNamed: #Field.
	
	method := self remoteEntity: #Method withPrefix: #FamixJava.
	parameter := self remoteEntity: #Parameter withPrefix: #FamixJava.
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineHierarchy [

	super defineHierarchy.
	stackline --|> entity.
	methodCall --|> entity.
	instance --|> entity.
	primitiveType --|> instance.
	instanceReference --|> instance.
	objectReference --|> instanceReference.
	arrayReference --|> instanceReference.
	stringReference --|> instanceReference.
	field --|> entity.
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineProperties [

	super defineProperties.

	self flag: #todo. "stackline>>number and instance>>uniqueID should be number/integer and not Object"
	stackline property: #number type: #Object.
	method property: #name type: #String.

	instance property: #uniqueID type: #Object.

	self flag: #todo. "Argument and Instance should not have their type as properties but as relations to an object representing java types"
	instance property: #type type: #String.
	stringReference property: #value type: #String.

	field property: #name type: #String
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineRelations [

	super defineRelations.
	stackline <>- methodCall.
	(stackline property: #receiver) *- (instanceReference property: #receiverUsages).
	(stackline property: #previous) - (stackline property: #next).

	methodCall *- method.
	(methodCall property: #arguments) *-* (instance property: #methodUsages).
	(arrayReference property: #elements) *-* (instance property: #arrayUsages).
	
	objectReference -* field.
	field *- instance.
]
