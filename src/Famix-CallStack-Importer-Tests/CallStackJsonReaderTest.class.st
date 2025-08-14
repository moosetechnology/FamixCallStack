Class {
	#name : 'CallStackJsonReaderTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-CallStack-Importer-Tests',
	#package : 'Famix-CallStack-Importer-Tests'
}

{ #category : 'running' }
CallStackJsonReaderTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	reader := CallStackJsonReader new.
	reader model: (FamixCSModel new
			 name: 'testing';
			 yourself)
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleFieldDict [
	| fieldDict |
	fieldDict := Dictionary new.
	fieldDict at: #name put: #aField.
	fieldDict at: #value put: self simpleValueDict.
	^ fieldDict
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleMethodCallDict [

	| methodCallDict argsDict methodDict |
	methodCallDict := Dictionary new.
	methodCallDict at: #arguements put: (argsDict := Dictionary new).
	argsDict at: #argsValues put: {  }.

	"create a simple method with no paremeter to make sure no errors happens from having no arguments"
	methodDict := self simpleMethodDict at: #parameters put: {  }.
	methodCallDict at: #method put: methodDict
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleMethodDict [

	| methodDict |
	methodDict := Dictionary new.
	methodDict at: #name put: #main.
	methodDict at: #parentType put: 'Pharo'.
	methodDict at: #isClassSide put: true.

	methodDict at: #parameters put: {  }.
	^ methodDict
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleParameterDict [

	| parameterDict |
	parameterDict := Dictionary new.
	parameterDict at: #name put: #args.
	parameterDict at: #type put: #Pharo.
	^ parameterDict
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleValueDict [
	"Provide a simple value structure"
	"Used to make a valid structure while not needing to pay attention to the value"
	| primTypeDict primValDict|
	
	primValDict := Dictionary new.
	primValDict at: #type put: #int.
	primValDict at: #value put: 42.
	
	primTypeDict := Dictionary new.
	primTypeDict at: #primitiveType put: primValDict.
	
	^ primTypeDict
	
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
	arg := reader createArgument: self simpleValueDict.
	
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
	fieldDict := self simpleFieldDict.
	fieldDict at: #accessible put: true.

	[ field := reader createField: fieldDict ] onErrorDo: [ self fail ].

	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldCreatedFieldIsInTheModel [

	| fieldDict field |
	fieldDict := self simpleFieldDict.

	[ field := reader createField: fieldDict ] onErrorDo: [ self fail ].

	self assert: (reader model includes: field).
	

]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoName [

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict removeKey: #name.

	self should: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoPrecsionOnAccessible [

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict removeKey: #accessible ifAbsent: [ "not problem if already absent" ].

	[ field := reader createField: fieldDict ] onErrorDo: [ self fail ].
	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValueWhileAccessible [
	"Create a collection to test createField"

	| field fieldDict |
	fieldDict := self simpleFieldDict.
	fieldDict at: #accessible put: true.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNotAccessibleWithNoValue [

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict at: #accessible put: false.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].

	[ field := reader createField: fieldDict ] onErrorDo: [ self fail ].
	self assert: field isAccessible not
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWhileInaccessible [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict at: #accessible put: false.
	fieldDict at: #value put: self simpleValueDict.
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWithNilValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict at: #value put: nil.
	
	field := reader createField: fieldDict. 
	self assert: field value isNil
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWithNilValueWhileInaccessible [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := self simpleFieldDict.
	fieldDict at: #value put: nil.
	fieldDict at: #accessible put: false.
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCall [
	"To test:
	- error if different number of arguments and parameters?
	- accessibility (same as a field if arguments are inaccessible should not have value, and if accessible should have values)
	- a method is created, and an error happen if no method can be created"

	| methodCall |
	methodCall := self simpleMethodCallDict.
	self fail
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentNameButSameType [
	"Create two time the same method, and check if the is only one"
	reader createMethod: self simpleMethodDict.
	reader createMethod: (self simpleMethodDict at:#name put:#imDIFFERENT; yourself).
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentTypeButSameName [
	"Create two time the same method, and check if the is only one"
	reader createMethod: self simpleMethodDict.
	reader createMethod: (self simpleMethodDict at:#parentType put:#ImDIFFERENT; yourself).
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodsIfNotTheSameParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := self simpleMethodDict
		              at: #parameters put: { self simpleParameterDict };
		              yourself.
	method := reader createMethod: methodDict.

	"create a method making sure parameters is empty"
	methodDict := self simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 2
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCreatedMethodCallIsInTheModel [

	self fail.
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreatedMethodIsInTheModel [

	| method |
	method := reader createMethod: self simpleMethodDict.

	self assert: (reader model includes: method)
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodDontCreateTwice [
	"Create two time the same method, and check if the is only one"
	reader createMethod: self simpleMethodDict.
	reader createMethod: self simpleMethodDict.
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 1
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is empty"
	methodDict := self simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isEmpty
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodIsClassSide [
	"Create two time the same method, and check if the is only one"

	self assert: (reader createMethod: (self simpleMethodDict
				  at: #isClassSide put: true;
				  yourself)) isClassSide.

	self assert: (reader createMethod: (self simpleMethodDict
				  at: #isClassSide put: false; at:#name put:#imDIFFERENT;
				  yourself)) isClassSide not
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodIsStub [
	"Create two time the same method, and check if the is only one"
	
	| method |
	method := reader createMethod: self simpleMethodDict.
	
	self assert: method isStub.
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodNotEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := self simpleMethodDict
		              at: #parameters put: { self simpleParameterDict };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isNotEmpty
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodParentType [
	"Create two time the same method, and check if the is only one"
	| method name |
	method := (reader createMethod: (self simpleMethodDict
				  at: #parentType put: (name := #Pharo);
				  yourself)).
				
	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParameters [
	"To test:
	- is in the model
	-Name
	-Typing"
	self fail.
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveType [
	"To test:
	-- is in the model
	- suffix, with and without (same as create class)
	- isStub"
	self fail.
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveValue [
	"To test:
	- is in the model
	- Typing
	- value with and without (without is an error)"
	self fail.
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStackline [
	"To test:
	- is in the model
	- receveir nil and not nil
	- method call can't be nil"
	self fail.
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
