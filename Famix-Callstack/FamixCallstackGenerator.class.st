Class {
	#name : 'FamixCallstackGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'stackline',
		'argument',
		'receiver',
		'entity',
		'parameter',
		'invocation',
		'invocationReceiver',
		'method'
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
	receiver := builder newClassNamed: #Receiver.
	method := builder newClassNamed: #Method.

	parameter := self remoteEntity: #Parameter withPrefix: #FamixJava.
	invocation := self remoteEntity: #Invocation withPrefix: #FamixJava.
"	invocationReceiver := self remoteEntity: #TInvocationReceiver withPrefix: #Famix."
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineHierarchy [

	super defineHierarchy.
	stackline --|> entity.
	argument --|> entity.
	receiver --|> entity.
	method --|> entity
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineProperties [

	super defineProperties.
	argument property: #type type: #String.
	argument property: #value type: #Object.
	method property: #name type: #String
]

{ #category : 'definition' }
FamixCallstackGenerator >> defineRelations [

	super defineRelations.
	stackline <>-* argument.
	stackline <>- receiver.
	stackline <>- method.
]
