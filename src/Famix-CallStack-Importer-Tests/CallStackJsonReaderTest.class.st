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
CallStackJsonReaderTest >> simpleMethod [

	| method |
	method := Dictionary new.
	method at: #name put: #main.
	method at: #parentType put: 'Pharo'.
	method at: #isClassSide put: true.

	method at: #parameters put: {  }.
	^ method
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleParameter [

	| parameter |
	parameter := Dictionary new.
	parameter at: #name put: #args.
	parameter at: #type put: #Pharo.
	^ parameter
]

{ #category : 'simple structures' }
CallStackJsonReaderTest >> simpleValue [
	"Provide a simple value structure"
	"Used to make a valid structure while not needing to pay attention to the value"
	| primType primVal|
	
	primVal := Dictionary new.
	primVal at: #type put: #int.
	primVal at: #value put: 42.
	
	primType := Dictionary new.
	primType at: #primitiveType put: primVal.
	
	^ primType
	
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
	arg := reader createArgument: self simpleValue.
	
	self assert: arg value isNotNil.
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

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	dict at: #accessible put: true.
	dict at: #value put: self simpleValue.

	[ field := reader createField: dict ] onErrorDo: [ self fail ].

	self assert: (reader model includes: field).
	self assert: field name equals: name.
	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoName [

	| dict field |
	dict := Dictionary new.
	dict at: #value put: self simpleValue.

	self should: [ field := reader createField: dict ] raise: Error
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoPrecsionOnAccessible [

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	dict at: #value put: self simpleValue.

	[ field := reader createField: dict ] onErrorDo: [ self fail ].

	self assert: (reader model includes: field).
	self assert: field name equals: name.
	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValue [
	"Create a collection to test createField"

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	
	self should: [ field := reader createField: dict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValueWhileAccessible [
	"Create a collection to test createField"

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	
	self should: [ field := reader createField: dict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNotAccessible [

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	dict at: #accessible put: false.

	[ field := reader createField: dict ] onErrorDo: [ self fail ].

	self assert: (reader model includes: field).
	self assert: field name equals: name.
	self assert: field isAccessible not
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWhileInaccessible [
	"Create a collection to test createField"

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	dict at: #accessible put: false.
	dict at: #value put: self simpleValue.
	
	self should: [ field := reader createField: dict ] raise: Error.
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldValueWithNilValue [
	"Create a collection to test createField"

	| dict field name |
	dict := Dictionary new.
	dict at: #name put: (name := #aField).
	dict at: #accessible put: false.
	dict at: #value put: nil.
	
	field := reader createField: dict. 
	self assert: field value isNil
]

{ #category : 'createMethodCall' }
CallStackJsonReaderTest >> testCreateMethodCall [
	"To test:
	- error if different number of arguments and parameters?
	- accessibility
	- a method is created, and an error happen if no method can be created"
	self fail.
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentNameButSameType [
	"Create two time the same method, and check if the is only one"
	reader createMethod: self simpleMethod.
	reader createMethod: (self simpleMethod at:#name put:#imDIFFERENT; yourself).
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentTypeButSameName [
	"Create two time the same method, and check if the is only one"
	reader createMethod: self simpleMethod.
	reader createMethod: (self simpleMethod at:#parentType put:#ImDIFFERENT; yourself).
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreateTwoMethodsIfNotTheSameParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := self simpleMethod
		              at: #parameters put: { self simpleParameter };
		              yourself.
	method := reader createMethod: methodDict.

	"create a method making sure parameters is empty"
	methodDict := self simpleMethod
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 2
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodDontCreateTwice [
	"Create two time the same method, and check if the is only one"
	reader createMethod: self simpleMethod.
	reader createMethod: self simpleMethod.
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size = 1
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is empty"
	methodDict := self simpleMethod
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isEmpty
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodIsClassSide [
	"Create two time the same method, and check if the is only one"

	self assert: (reader createMethod: (self simpleMethod
				  at: #isClassSide put: true;
				  yourself)) isClassSide.

	self assert: (reader createMethod: (self simpleMethod
				  at: #isClassSide put: false; at:#name put:#imDIFFERENT;
				  yourself)) isClassSide not
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodIsStub [
	"Create two time the same method, and check if the is only one"
	
	| method |
	method := reader createMethod: self simpleMethod.
	
	self assert: method isStub.
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodNotEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := self simpleMethod
		              at: #parameters put: { self simpleParameter };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isNotEmpty
]

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodParentType [
	"Create two time the same method, and check if the is only one"
	| method name |
	method := (reader createMethod: (self simpleMethod
				  at: #parentType put: (name := #Pharo);
				  yourself)).
				
	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParameters [
	"To test:
	-Name
	-Typing"
	self fail.
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveType [
	"To test:
	- suffix, with and without (same as create class)
	- isStub"
	self fail.
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveValue [
	"To test:
	- Typing
	- value with and without (without is an error)"
	self fail.
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStackline [
	"To test:
	- receveir nil and not nil
	- method call can't be nil"
	self fail.
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReference [
	"To test:
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
	- class not prepared"
	self fail.
]
