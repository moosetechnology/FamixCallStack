Class {
	#name : 'FamixCallStackGenerator',
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
		'stack',
		'tEntityMetaLevelDependency',
		'tTypedEntity',
		'receiver'
	],
	#category : 'Famix-CallStack',
	#package : 'Famix-CallStack'
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
	receiver := builder newClassNamed: #Receiver.

	method := self remoteEntity: #Method withPrefix: #FamixJava.
	primitiveType := self remoteEntity: #PrimitiveType withPrefix: #FamixJava.
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineHierarchy [

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
	value --|> #TTypedEntity.
	field --|> tValueContainer.
	arrayValue --|> tValueContainer.
	argument --|> tValueContainer.
	receiver --|> tValueContainer.

	"querryable"
	stack --|> #TEntityMetaLevelDependency.
	stackline --|> #TEntityMetaLevelDependency.
	methodCall --|> #TEntityMetaLevelDependency.
	tValueContainer --|> #TEntityMetaLevelDependency.
	value --|> #TEntityMetaLevelDependency.
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineProperties [

	super defineProperties.
	self flag:#todo. "the attribute isStatic doesn't appear to be generated, this attibute is acutally being added manually"
	method property: #isStatic type: #Boolean.
	
	primitiveValue property: #value type: #Object.

	objectReference property: #uniqueID type: #Number.

	stringReference property: #value type: #String.

	arrayReference property: #size type: #Number.

	self flag:#todo. "Maybe field should use TNamedEntity?"
	field property: #name type: #String.
	
	tValueContainer property: #maxDepthReached type: #Boolean defaultValue: false .
	tValueContainer property: #unaccessible type: #Boolean defaultValue: false.
	
	classReference property: #unprepared type: #Boolean defaultValue: false.
	self flag: #todo "try adding more information on argument (like the name or order of these)"
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineRelations [

	super defineRelations.
	stack <>-* stackline.
	stackline <>- methodCall.
	stackline <>- receiver.

	methodCall *- method.

	(classReference property: #field) -* (field property: #parent).
	(arrayReference property: #elements) -* (arrayValue property: #parent).
	(methodCall property: #arguments) -* (argument property: #parent).

	(tValueContainer property: #value) *- (value property: #usage)
]

{ #category : 'definition' }
FamixCallStackGenerator >> defineTraits [

	super defineTraits.

	tValueContainer := builder newTraitNamed: #TValueContainer.
]
