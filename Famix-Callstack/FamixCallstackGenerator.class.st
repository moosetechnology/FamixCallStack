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
		'argument',
		'tValueContainer',
		'stack'
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
	stack := builder newClassNamed: #Stack.
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
	primitiveType := self remoteEntity: #PrimitiveType withPrefix: #FamixJava
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineHierarchy [

	super defineHierarchy.
	
	"inheritances"
	stack --|> entity.
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
	
	"trait usages"
	field --|> tValueContainer.
	arrayValue --|> tValueContainer.
	argument --|> tValueContainer.
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineProperties [

	super defineProperties.
	
	method property: #name type: #String.

	primitiveValue property: #value type: #Object.

	self flag: #todo. "ishould not have their type as properties but as relations to an object representing java types"
	objectReference property: #type type: #String.
	objectReference property: #uniqueID type: #Number.

	stringReference property: #value type: #String.

	arrayReference property: #size type: #Number.

	field property: #name type: #String.
	self flag: #todo "try adding more information on argument (like the name or order of these)"
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineRelations [

	super defineRelations.
	stack <>-* stackline.
	stackline <>- methodCall.
	self flag: #todo. "add the trati TvaluesContainer to stackline"
	(stackline property: #receiver) *- (objectReference property: #receiverUsages).

	methodCall *- method.

	(classReference property: #field) -* (field property: #parent).
	(arrayReference property: #elements) -* (arrayValue property: #parent).
	(methodCall property: #arguments) -* (argument property: #parent).

	(tValueContainer property: #value) *- (value property: #usage).

	(primitiveValue property: #type) - (primitiveType property: #usages)
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineTraits [

	super defineTraits.

	tValueContainer := builder newTraitNamed: #TValueContainer
]
