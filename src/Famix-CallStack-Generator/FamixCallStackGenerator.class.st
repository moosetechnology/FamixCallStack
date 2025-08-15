Class {
	#name : 'FamixCallStackGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'stackline',
		'entity',
		'parameter',
		'method',
		'arrayReference',
		'stringReference',
		'field',
		'primitiveValue',
		'value',
		'classReference',
		'objectReference',
		'arrayValue',
		'argument',
		'tValueContainer',
		'stack',
		'tEntityMetaLevelDependency',
		'tTypedEntity',
		'receiver'
	],
	#category : 'Famix-CallStack-Generator',
	#package : 'Famix-CallStack-Generator'
}

{ #category : 'accessing' }
FamixCallStackGenerator class >> packageName [

    ^ #'Famix-Callstack-Entities'
]

{ #category : 'accessing' }
FamixCallStackGenerator class >> prefix [

    ^ #'FamixCS'
]

{ #category : 'accessing' }
FamixCallStackGenerator class >> submetamodels [
	^ {FamixJavaGenerator}
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineClasses [

	super defineClasses.

	entity := builder newClassNamed: #Entity.
	stack := builder newClassNamed: #Stack.
	stackline := builder newClassNamed: #Stackline.

	value := builder newClassNamed: #Value.
	primitiveValue := builder newClassNamed: #PrimitiveValue.
	objectReference := builder newClassNamed: #ObjectReference.
	classReference := builder newClassNamed: #ClassReference.
	arrayReference := builder newClassNamed: #ArrayReference.
	stringReference := builder newClassNamed: #StringReference.

	argument := builder newClassNamed: #Argument.
	field := builder newClassNamed: #Field.
	arrayValue := builder newClassNamed: #ArrayValue.
	receiver := builder newClassNamed: #Receiver.

	method := self remoteEntity: #Method withPrefix: #FamixJava.
	parameter := self remoteEntity: #Parameter withPrefix: #FamixJava.
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineHierarchy [

	super defineHierarchy.

	"inheritances"
	stack --|> entity.
	stackline --|> entity.
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
	value --|> #TTypedEntity.
	field --|> tValueContainer.
	arrayValue --|> tValueContainer.
	argument --|> tValueContainer.
	receiver --|> tValueContainer.

	"querryable"
	stack --|> #TEntityMetaLevelDependency.
	stackline --|> #TEntityMetaLevelDependency.
	tValueContainer --|> #TEntityMetaLevelDependency.
	value --|> #TEntityMetaLevelDependency.
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineProperties [

	super defineProperties.
	
	primitiveValue property: #value type: #Object.

	objectReference property: #uniqueID type: #Number.

	stringReference property: #value type: #String.

	self flag:#todo. "should field use #TNamedEntity ?"
	field property: #name type: #String.
	
	field property: #isAtMaxDepth type: #Boolean defaultValue: false .
	arrayValue property: #isAtMaxDepth type: #Boolean defaultValue: false .
	field property: #isAccessible type: #Boolean defaultValue: true.
	stackline property: #isArgsAccessible type: #Boolean defaultValue: true.
	classReference property: #isPrepared type: #Boolean defaultValue: true.
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineRelations [

	super defineRelations.
	stack <>-* stackline.
	stackline *- method.
	stackline <>- receiver.
	
	argument *- parameter.

	(classReference property: #fields) -* (field property: #parent).
	(arrayReference property: #elements) -* (arrayValue property: #parent).
	(stackline property: #arguments) -* (argument property: #parent).

	(tValueContainer property: #value) *- (value property: #usage)
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineTraits [

	super defineTraits.

	tValueContainer := builder newTraitNamed: #TValueContainer.
]
