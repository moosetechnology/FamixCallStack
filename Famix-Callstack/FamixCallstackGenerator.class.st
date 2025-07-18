Class {
	#name : 'FamixCallstackGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'stackline',
		'entity',
		'parameter',
		'method',
		'methodCall',
		'arrayReference',
		'stringReference',
		'field',
		'primitiveValue',
		'primitiveType',
		'value',
		'classReference',
		'objectReference',
		'arrayValue',
		'argument'
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

	value := builder newClassNamed: #Value.
	primitiveValue := builder newClassNamed: #PrimitiveValue.
	objectReference := builder newClassNamed: #ObjectReference.
	classReference := builder newClassNamed: #ClassReference.
	arrayReference := builder newClassNamed: #ArrayReference.
	stringReference := builder newClassNamed: #StringReference.

	argument := builder newClassNamed: #Argument.
	field := builder newClassNamed: #Field.
	arrayValue := builder newClassNamed: #ArrayValue.

	method := self remoteEntity: #Method withPrefix: #FamixJava.
	parameter := self remoteEntity: #Parameter withPrefix: #FamixJava.
	primitiveType := self remoteEntity: #PrimitiveType withPrefix: #FamixJava
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineHierarchy [

	super defineHierarchy.
	stackline --|> entity.
	methodCall --|> entity.
	value --|> entity.
	primitiveValue --|> value.
	objectReference --|> value.
	classReference --|> objectReference.
	arrayReference --|> objectReference.
	stringReference --|> objectReference.
	field --|> entity.
	arrayValue --|> entity.
	argument --|> entity.
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineProperties [

	super defineProperties.

	self flag: #todo. "stackline>>number and instance>>uniqueID should be number/integer and not Object"
	stackline property: #number type: #Object.
	method property: #name type: #String.
	
	primitiveValue property: #value type: #Object.

	self flag: #todo. "ishould not have their type as properties but as relations to an object representing java types"
	objectReference property: #type type: #String.
	objectReference property: #uniqueID type: #Object.

	stringReference property: #value type: #String.
	
	arrayReference property: #size type: #Object.

	field property: #name type: #String.
	self flag:#todo. "try adding more information on argument (like the name or order of these"
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineRelations [

	super defineRelations.
	stackline <>- methodCall.
	(stackline property: #receiver) *- (objectReference property: #receiverUsages).
	(stackline property: #previous) - (stackline property: #next).

	methodCall *- method.
	(methodCall property: #arguments) *-* (value property: #methodUsages).
	
	(classReference property: #field) -* (field property: #parent).
	(field property: #value)*- (value property: #fieldUsages).
	
	
	(arrayReference property: #elements) -* (arrayValue property: #parent).
	(arrayValue property: #value)*- (value property: #fieldUsages).
	
	(methodCall property: #arguments) -* (argument property: #parent).
	(argument property: #value)*- (value property: #argumentUsages).
	
	(primitiveValue property: #type) - (primitiveType property: #usages).
	
]
