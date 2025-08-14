Class {
	#name : 'CallStackJsonReaderTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-CallStack-Importer-Tests',
	#package : 'Famix-CallStack-Importer-Tests'
}

{ #category : 'setup' }
CallStackJsonReaderTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	reader := CallStackJsonReader new.
	reader model: (FamixCSModel new
			 name: 'testing';
			 yourself)
]

{ #category : 'createArrayArgument' }
CallStackJsonReaderTest >> testCreateArgumentCreatedArgumentIsInTheModel [

	| arg |
	arg := reader createArgument: nil.
	
	self assert: (reader model includes: arg).
]

{ #category : 'createArrayArgument' }
CallStackJsonReaderTest >> testCreateArgumentWithNilValue [

	| arg |
	arg := reader createArgument: nil.
	
	self assert: arg value isNil.
]

{ #category : 'createArrayArgument' }
CallStackJsonReaderTest >> testCreateArgumentWithValue [

	| arg |
	"In this test we just need to know if a value is imported, how the value is imported is not useful here"
	arg := reader createArgument: CSStructureCreator simpleValueDict.
	
	self assert: arg value isNotNil.
]

{ #category : 'createClassNamed' }
CallStackJsonReaderTest >> testCreateClassCreatedClassIsInTheModel [

	| class |
	class := reader createClassNamed: 'Myclass[]'.
	
	self assert: (reader model includes: class).
]

{ #category : 'createClassNamed' }
CallStackJsonReaderTest >> testCreateClassNamedArray [

	| class |
	"In FamixJava, no differencies are made on typing with an array of a class or with a class"
	class := reader createClassNamed: 'Myclass[]'.

	self assert: class isStub.
	self assert: class name equals: #Myclass
]

{ #category : 'createClassNamed' }
CallStackJsonReaderTest >> testCreateClassNamedNormal [
	| class name | 
	
	class := reader createClassNamed: (name := #Myclass).
	
	self assert: class isStub.
	self assert: class name equals: name.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldAccessible [

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: true.

	[ field := reader createField: fieldDict ] onErrorDo: [ self fail ].

	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldCreatedFieldIsInTheModel [

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.

	[ field := reader createField: fieldDict ] onErrorDo: [ self fail ].

	self assert: (reader model includes: field).
	

]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoName [

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict removeKey: #name.

	self should: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoPrecsionOnAccessible [

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict removeKey: #accessible ifAbsent: [ "not problem if already absent" ].

	self shouldnt: [ field := reader createField: fieldDict  ] raise: Error.
	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValueWhileAccessible [
	"Create a collection to test createField"

	| field fieldDict |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: true.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNotAccessibleWithNoValue [

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: false.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].

	self shouldnt: [ field := reader createField: fieldDict  ] raise: Error.
	self assert: field isAccessible not
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWhileInaccessible [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: false.
	fieldDict at: #value put: CSStructureCreator simpleValueDict.
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWithNilValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict at: #value put: nil.
	
	field := reader createField: fieldDict. 
	self assert: field value isNil
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWithNilValueWhileInaccessible [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict at: #value put: nil.
	fieldDict at: #accessible put: false.
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallArgumentsAccessibleWithValue [

	| methodCallDict argsDict |
	methodCallDict := CSStructureCreator simpleMethodCallDict.
	methodCallDict at: #method put: (CSStructureCreator simpleMethodDict
			 at: #parameters put: { CSStructureCreator simpleParameterDict };
			 yourself).

	argsDict := methodCallDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.
	argsDict at: #accessible put: true.

	self shouldnt: [ reader createMethodCall: methodCallDict ] raise: Error
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallArgumentsAccessibleWithoutValue [

	| methodCallDict argsDict |
	methodCallDict := CSStructureCreator simpleMethodCallDict.
	argsDict := methodCallDict at: #arguments.
	argsDict removeKey: #argsValues ifAbsent: ["no problem if already absent"].
	argsDict at: #accessible put: true.

	self should: [ reader createMethodCall: methodCallDict ] raise: Error
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallArgumentsInAccessibleWithValue [

	| methodCallDict argsDict |
	methodCallDict := CSStructureCreator simpleMethodCallDict.
	argsDict := methodCallDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.
	argsDict at: #accessible put: false.

	self should: [ reader createMethodCall: methodCallDict ] raise: Error
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallArgumentsInAccessibleWithoutValue [

	| methodCallDict argsDict |
	methodCallDict := CSStructureCreator simpleMethodCallDict.
	argsDict := methodCallDict at: #arguments.
	argsDict removeKey: #argsValues ifAbsent: ["no problem if already absent"].
	argsDict at: #accessible put: false.

	self shouldnt: [ reader createMethodCall: methodCallDict ] raise: Error
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallCheckMethodCreation [

	| methodCallDict methodCall |
	methodCallDict := CSStructureCreator simpleMethodCallDict.
	methodCallDict at: #method put: CSStructureCreator simpleMethodDict.

	methodCall := reader createMethodCall: methodCallDict.
	self assert: methodCall method isNotNil
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallDifferentNumberOfArgumentsAndParametersWhileAccessible [

	| methodCallDict methodDict argsDict |
	methodCallDict := CSStructureCreator simpleMethodCallDict.

	methodDict := methodCallDict at: #method put: CSStructureCreator simpleMethodDict.
	methodDict at: #parameters put: {  }.

	argsDict := methodCallDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.
	argsDict at: #accessible put: true.

	self should: [ reader createMethodCall: methodCallDict ] raise: Error
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCallNoMethod [

	| methodCallDict |
	methodCallDict := CSStructureCreator simpleMethodCallDict.
	methodCallDict removeKey: #method ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createMethodCall: methodCallDict ] raise: Error
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentNameButSameType [
	"Create two time the same method, and check if the is only one"

	reader createMethod: CSStructureCreator simpleMethodDict.
	reader createMethod: (CSStructureCreator simpleMethodDict
			 at: #name put: #imDIFFERENT;
			 yourself).

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentTypeButSameName [
	"Create two time the same method, and check if the is only one"

	reader createMethod: CSStructureCreator simpleMethodDict.
	reader createMethod: (CSStructureCreator simpleMethodDict
			 at: #parentType put: #ImDIFFERENT;
			 yourself).

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodsIfNotTheSameParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := CSStructureCreator simpleMethodDict
		              at: #parameters put: { CSStructureCreator simpleParameterDict };
		              yourself.
	method := reader createMethod: methodDict.

	"create a method making sure parameters is empty"
	methodDict := CSStructureCreator simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCreatedMethodCallIsInTheModel [

	| methodCall |
	methodCall := reader createMethodCall: CSStructureCreator simpleMethodCallDict.

	self assert: (reader model includes: methodCall)
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreatedMethodIsInTheModel [

	| method |
	method := reader createMethod: CSStructureCreator simpleMethodDict.

	self assert: (reader model includes: method)
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodDontCreateTwice [
	"Create two time the same method, and check if the is only one"
	reader createMethod: CSStructureCreator simpleMethodDict.
	reader createMethod: CSStructureCreator simpleMethodDict.
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 1
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is empty"
	methodDict := CSStructureCreator simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isEmpty
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodIsClassSide [
	"Create two time the same method, and check if the is only one"

	self assert: (reader createMethod: (CSStructureCreator simpleMethodDict
				  at: #isClassSide put: true;
				  yourself)) isClassSide.

	self assert: (reader createMethod: (CSStructureCreator simpleMethodDict
				  at: #isClassSide put: false; at:#name put:#imDIFFERENT;
				  yourself)) isClassSide not
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodIsStub [
	"Create two time the same method, and check if the is only one"
	
	| method |
	method := reader createMethod: CSStructureCreator simpleMethodDict.
	
	self assert: method isStub.
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodNotEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := CSStructureCreator simpleMethodDict
		              at: #parameters put: { CSStructureCreator simpleParameterDict };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isNotEmpty
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodParentType [
	"Create two time the same method, and check if the is only one"
	| method name |
	method := (reader createMethod: (CSStructureCreator simpleMethodDict
				  at: #parentType put: (name := #Pharo);
				  yourself)).
				
	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParametersCreatedParametersAreInModel [

	| paramArray parameters |
	paramArray := { CSStructureCreator simpleParameterDict }.
	parameters := reader createParameters: paramArray.

	self assert: (reader model includesAll: parameters)
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParametersEmpty [

	| paramArray paramResult |
	paramArray := {  }.
	paramResult := reader createParameters: paramArray.

	self assert: paramArray isEmpty
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParametersName [

	| paramArray name parameters |
	paramArray := { (CSStructureCreator simpleParameterDict
		               at: #name put: (name := #args);
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param name equals: name ]
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParametersTyping [

	| paramArray type parameters |
	paramArray := { (CSStructureCreator simpleParameterDict
		               at: #name put: (type := #Pharo);
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param typing declaredType name equals: type ]
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveTypeCreatedPrimitiveTypeIsInTheModel [

	| primType |
	primType := reader createPrimitiveType: #int.

	self assert: (reader model includes: primType)
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveTypeDeleteSuffix [
	| primType |
	"In FamixJava there is no diference in typing with array or single value"
	primType := reader createPrimitiveType: 'int[]'.

	self assert:  primType name equals: #int
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveTypeIsStub [
	| primType |
	primType := reader createPrimitiveType: #int.

	self assert:  primType isStub
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueCreatedPrimitiveValueIsInTheModel [

	| primVal |
	primVal := reader createPrimitiveValue: CSStructureCreator simplePrimitiveValueDict.

	self assert: (reader model includes: primVal)
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueTyping [

	| primVal |
	primVal := reader createPrimitiveValue: (CSStructureCreator simplePrimitiveValueDict
			            at: #type put: #int;
			            yourself).

	self assert: primVal typing declaredType name equals: #int
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueWithValue [

	| primVal value |
	primVal := reader createPrimitiveValue: (CSStructureCreator simplePrimitiveValueDict
			            at: #value put: (value := 42);
			            yourself).

	self assert: primVal value equals: value
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueWithoutValue [

	| primValDict |
	primValDict := CSStructureCreator simplePrimitiveValueDict.
	primValDict removeKey: #value ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createPrimitiveValue: primValDict ] raise: Error
]

{ #category : 'createReceiver' }
CallStackJsonReaderTest >> testCreateReceiver [
	self fail. "test if an error is signaled if using a primitiveType instead of an objectReference"
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineCreatedStacklineIsInTheModel [

	| stackline |
	stackline := reader createStackline: CSStructureCreator simpleStacklineDict.

	self assert: (reader model includes: stackline)
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineReceiverNil [

	| stacklineDict stackline |
	stacklineDict := CSStructureCreator simpleStacklineDict
		                 at: #receiver put: nil;
		                 yourself.

	stackline := reader createStackline: stacklineDict.

	self assert: stackline receiver isNil
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineReceiverNotNil [

	| stacklineDict stackline |
	stacklineDict := CSStructureCreator simpleStacklineDict
		                 at: #receiver put: CSStructureCreator simpleArrayReference;
		                 yourself.

	stackline := reader createStackline: stacklineDict.

	self assert: stackline receiver isNotNil
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReference [
	"To test:
	- is in the model
	- ref already found : 
		-if none, 
		- if one, 
		- if indicated as alreadyfound but not yet
		- if trying to create an object already created
	- a reference is created (we don't care which one, but we want to know if instantiateReferenceEntityFrom: is called and same for fillFrom:reader: *use mocks*)
	- type : how to choose between a class and a primitive type (with dots)
	- check if the typing of reference match"
	self fail.
]

{ #category : 'createValueWith' }
CallStackJsonReaderTest >> testCreateValueWith [
	"To test:
	- is in the model
	- reference created
	- primitiveType create
	- fail if no reference or no primitiveType found"
	self fail.
]

{ #category : 'reading' }
CallStackJsonReaderTest >> testRead [
	"to test
	- creation of stack line having multiples
	- moose name reseting? or at least add a comment"
	self fail.
]

{ #category : 'fillValueCheckingMaxDepth' }
CallStackJsonReaderTest >> testfillValueCheckingMaxDepth [
	"to test:
	- with and without the MAXDEPTH tag
	- with a String but not the tag (with and without <<>> both are errors)
	- ifCollection is nil and if not"
	self fail.
]

{ #category : 'instantiateReferenceEntity' }
CallStackJsonReaderTest >> testinstantiateReferenceEntity [
	"to test:
	- class/array/string
		- for each - is in the model
	- class not prepared"
	self fail.
]
