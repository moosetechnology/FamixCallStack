Class {
	#name : 'FamixCallstackGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'stackline',
		'argument',
		'entity',
		'parameter',
		'invocation',
		'invocationReceiver',
		'method',
		'instance',
		'objectReference',
		'primitiveType'
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
	argument := builder newClassNamed: #Argument.
	instance := builder newClassNamed: #Instance.
	objectReference := builder newClassNamed: #ObjectReference.
	primitiveType := builder newClassNamed: #PrimitiveType.
	
	method := self remoteEntity: #Method withPrefix: #FamixJava.
	parameter := self remoteEntity: #Parameter withPrefix: #FamixJava.
	self flag:#todo. "invocation are not necessary because we don't take this into account?"
	invocation := self remoteEntity: #Invocation withPrefix: #FamixJava.
"	invocationReceiver := self remoteEntity: #TInvocationReceiver withPrefix: #Famix."
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineHierarchy [

	super defineHierarchy.
	stackline --|> entity.
	argument --|> entity.
	instance --|> entity.
	objectReference --|> instance.
	primitiveType --|> instance.
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineProperties [

	super defineProperties.

	self flag: #todo. "stackline>>number and instance>>uniqueID should be number/integer and not Object"
	self flag: #todo. "Argument and Instance should not have their type as properties but as relations ?"
	stackline property: #number type: #Object.
	argument property: #type type: #String.
	method property: #name type: #String.

	instance property: #uniqueID type: #Object.
	instance property: #type type: #String.
	
	self flag:#todo."Should be a collection?"
	self flag:#todo." Could also be array values instead of fields"
	objectReference property: #fields type: #Object.
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineRelations [

	super defineRelations.
	self flag: #todo. "add a name for all thoses relations"
	stackline <>-* argument.
	(stackline property: #receiver) <>- (objectReference property: #receiverUsage).
	stackline *- method.
	method <>-* parameter.
	(argument property: #value) *- (instance property: #argumentUsage).
	objectReference <>-* instance.

	(stackline property: #previous) - (stackline property: #next).
	self flag: #todo "How to make sure the stack line know their previous and next stackline?"
]
