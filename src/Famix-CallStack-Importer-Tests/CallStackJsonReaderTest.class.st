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
	
	self assert: arg isArgument.
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
	
	self assert: class isClass.
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
CallStackJsonReaderTest >> testCreateClassNamedHandlePackages [

	| class |
	class := reader createClassNamed: 'org.example.Pharo'.

	self assert: class name equals: 'Pharo'.
	self assert: class typeContainer name equals: 'example'.
	self assert: class typeContainer parentPackage name equals: 'org'
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

	field := reader createField: fieldDict.

	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldCreatedFieldIsInTheModel [

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.

	field := reader createField: fieldDict.

	self assert: field isField.
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

	field := reader createField: fieldDict.
	self assert: field isAccessible
]

{ #category : 'createField' }
CallStackJsonReaderTest >> testCreateFieldNoValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := CSStructureCreator simpleFieldDict.
	fieldDict removeKey: #value ifAbsent: [ "no problem if already absent" ].
	
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

	field := reader createField: fieldDict.
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

{ #category : 'createMethod' }
CallStackJsonReaderTest >> testCreateMethodCreatedMethodIsInTheModel [

	| method |
	method := reader createMethod: CSStructureCreator simpleMethodDict.

	self assert: method isMethod.
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

{ #category : 'createPackage' }
CallStackJsonReaderTest >> testCreatePackageDefaultPackage [

	| package  |
	package := reader createPackageFromStringCollection: {  }.

	self assert: package name equals:  '<Default Package>'.
]

{ #category : 'createPackage' }
CallStackJsonReaderTest >> testCreatePackageFromStringCollection1Element [

	| package |
	package := reader createPackageFromStringCollection: { 'org' }.

	self assert: package name equals: 'org'.
]

{ #category : 'createPackage' }
CallStackJsonReaderTest >> testCreatePackageFromStringCollection2Elements [

	| package |
	package := reader createPackageFromStringCollection: { 'org'. 'example' }.

	self assert: package name equals: 'example'.
	self assert: package parentPackage name equals: 'org'
]

{ #category : 'createPackage' }
CallStackJsonReaderTest >> testCreatePackageFromStringCollectionReuseExistingPackages [

	| package1 package2 |
	package1 := reader createPackageFromStringCollection: { 'org'. 'example' }.
	package2 := reader createPackageFromStringCollection: { 'org'. 'test' }.

	self assert: package1 parentPackage identicalTo: package2 parentPackage.
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
		               at: #type put: (type := #Pharo);
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param typing declaredType name equals: type ]
]

{ #category : 'createParameters' }
CallStackJsonReaderTest >> testCreateParametersTypingPackage [

	| paramArray type parameters |
	paramArray := { (CSStructureCreator simpleParameterDict
		               at: #type put: (type := 'org.example.Pharo');
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param typing declaredType name equals: 'Pharo' ].
	parameters do: [ :param | self assert: param typing declaredType typeContainer name equals: 'example' ].
	parameters do: [ :param | self assert: param typing declaredType typeContainer parentPackage name equals: 'org' ].
]

{ #category : 'createPrimitiveType' }
CallStackJsonReaderTest >> testCreatePrimitiveTypeCreatedPrimitiveTypeIsInTheModel [

	| primType |
	primType := reader createPrimitiveType: #int.

	self assert: primType isPrimitiveType.
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
	primVal := reader createPrimitiveValue: (CSStructureCreator simplePrimitiveValueDict at: #primitiveValue).

	self assert: primVal isPrimitiveValue.
	self assert: (reader model includes: primVal)
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueTyping [

	| primVal |
	primVal := reader createPrimitiveValue: ((CSStructureCreator simplePrimitiveValueDict at:#primitiveValue)
			            at: #type put: #int;
			            yourself).

	self assert: primVal typing declaredType name equals: #int
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueWithValue [

	| primVal value |
	primVal := reader createPrimitiveValue: ((CSStructureCreator simplePrimitiveValueDict at: #primitiveValue)
			            at: #value put: (value := 42);
			            yourself).

	self assert: primVal value equals: value
]

{ #category : 'createPrimitiveValue' }
CallStackJsonReaderTest >> testCreatePrimitiveValueWithoutValue [

	| primValDict |
	primValDict := CSStructureCreator simplePrimitiveValueDict at: #primitiveValue.
	primValDict removeKey: #value ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createPrimitiveValue: primValDict ] raise: Error
]

{ #category : 'createReceiver' }
CallStackJsonReaderTest >> testCreateReceiverIsInTheModel [

	| receiver |
	receiver := reader createReceiver: CSStructureCreator simpleArrayReferenceDict.

 	self assert: receiver isReceiver.
	self assert: (reader model includes: receiver)
]

{ #category : 'createReceiver' }
CallStackJsonReaderTest >> testCreateReceiverNotAReference [

	self should: [ reader createReceiver: (CSStructureCreator simplePrimitiveValueDict at: #primitiveType) ] raise: Error
]

{ #category : 'createReceiver' }
CallStackJsonReaderTest >> testCreateReceiverWithReference [

	"Smoke test to make sure the reference we have is right"
	reader createReceiver: CSStructureCreator simpleArrayReferenceDict 
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineArgumentsAccessibleWithValue [
	"Smoke test, we just check if createStackline act as excpected"

	| stacklineDict argsDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	stacklineDict at: #method put: (CSStructureCreator simpleMethodDict
			 at: #parameters put: { CSStructureCreator simpleParameterDict };
			 yourself).

	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.
	argsDict at: #accessible put: true.

	reader createStackline: stacklineDict .
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineArgumentsAccessibleWithoutValue [

	| stacklineDict argsDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	argsDict := stacklineDict at: #arguments.
	argsDict removeKey: #argsValues ifAbsent: ["no problem if already absent"].
	argsDict at: #accessible put: true.

	self should: [ reader createStackline: stacklineDict ] raise: Error
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineArgumentsInAccessibleWithValue [

	| stacklineDict argsDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.
	argsDict at: #accessible put: false.

	self should: [ reader createStackline: stacklineDict ] raise: Error
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineArgumentsInAccessibleWithoutValue [
	"Smoke test, this test just check if no error happen in this case"

	| stacklineDict argsDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	argsDict := stacklineDict at: #arguments.
	argsDict
		removeKey: #argsValues
		ifAbsent: [ "no problem if already absent" ].
	argsDict at: #accessible put: false.

	reader createStackline: stacklineDict
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineCheckMethodCreation [

	| stacklineDict methodCall |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	stacklineDict at: #method put: CSStructureCreator simpleMethodDict.

	methodCall := reader createStackline: stacklineDict.
	self assert: methodCall method isNotNil
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineCreatedStacklineIsInTheModel [

	| stackline |
	stackline := reader createStackline: CSStructureCreator simpleStacklineDict.

	self assert: stackline isStackline.
	self assert: (reader model includes: stackline)
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineDifferentNumberOfArgumentsAndParametersWhileAccessible [

	| stacklineDict methodDict argsDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.

	methodDict := stacklineDict at: #method put: CSStructureCreator simpleMethodDict.
	methodDict at: #parameters put: {  }.

	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.
	argsDict at: #accessible put: true.

	self should: [ reader createStackline: stacklineDict ] raise: Error
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineLinkArgumentsAndParameters [

	| stacklineDict methodDict argsDict stackline |
	stacklineDict := CSStructureCreator simpleStacklineDict.

	methodDict := stacklineDict at: #method put: CSStructureCreator simpleMethodDict.
	methodDict at: #parameters put: { CSStructureCreator simpleParameterDict }.

	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { CSStructureCreator simpleValueDict }.

	stackline := reader createStackline: stacklineDict.

	self assert: stackline arguments first parameter equals: stackline method parameters first
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineNoMethod [

	| stacklineDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	stacklineDict removeKey: #method ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createStackline: stacklineDict ] raise: Error
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
		                 at: #receiver put: CSStructureCreator simpleArrayReferenceDict;
		                 yourself.

	stackline := reader createStackline: stacklineDict.

	self assert: stackline receiver isNotNil
]

{ #category : 'createStackline' }
CallStackJsonReaderTest >> testCreateStacklineWithNoMethod [

	| stacklineDict |
	stacklineDict := CSStructureCreator simpleStacklineDict.
	stacklineDict removeKey: #method ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createStackline: stacklineDict ] raise: Error
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReferenceAlreadyFoundWithAReferedValue [

	| arrayReferenceDict |
	arrayReferenceDict := CSStructureCreator simpleArrayReferenceDict at: #reference.
	"Making sure there is a refered value"
	arrayReferenceDict at: #refered put: (Dictionary new
			 at: #elements put: {  };
			 yourself).
	arrayReferenceDict at: #alreadyFound put: true.

	self should: [ reader createValueReference: arrayReferenceDict ] raise: Error
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReferenceAlreadyFoundWithoutAReferedValue [
	"Smoke test, we just check if createValueReference act as expected"
	| arrayReferenceDict |
	arrayReferenceDict := CSStructureCreator simpleArrayReferenceDict at: #reference.
	arrayReferenceDict at: #alreadyFound put: false.
	"Create it to make the reader able to find a link with the first appearance"
	reader createValueReference: arrayReferenceDict.
	
	"Making sure there is a no refered value"
	arrayReferenceDict removeKey: #refered ifAbsent: [ "No problem if already absent" ].
	arrayReferenceDict at: #alreadyFound put: true.

	reader createValueReference: arrayReferenceDict
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReferenceChooseClassAsTyping [

	| arrayReferenceDict arrayReference|
	arrayReferenceDict := CSStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict at:#type put:'my.app.Pharo'.
	
	arrayReference := reader createValueReference: arrayReferenceDict.
	
	self assert: arrayReference typing declaredType isClass.
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReferenceChoosePrimitiveTypeAsTyping [

	| arrayReferenceDict arrayReference|
	arrayReferenceDict := CSStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict at:#type put:#int.
	
	arrayReference := reader createValueReference: arrayReferenceDict.
	
	self assert: arrayReference typing declaredType isPrimitiveType.
	
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReferenceNotAlreadyFoundWithAReferedValue [
	"Smoke test, we just check if createValueReference hold the not already found value"

	| arrayReferenceDict |
	arrayReferenceDict := CSStructureCreator simpleArrayReferenceDict
		                      at: #reference.
	"Making sure there is a refered value"
	arrayReferenceDict at: #refered put: (Dictionary new
			 at: #elements put: {  };
			 yourself).
	arrayReferenceDict at: #alreadyFound put: false.

	reader createValueReference: arrayReferenceDict
]

{ #category : 'createValueReference' }
CallStackJsonReaderTest >> testCreateValueReferenceNotAlreadyFoundWithoutAReferedValue [

	| arrayReferenceDict |
	arrayReferenceDict := CSStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict removeKey: #refered ifAbsent: [ "No problem if already absent" ].
	arrayReferenceDict at: #alreadyFound put: false.

	self should: [ reader createValueReference: arrayReferenceDict ] raise: Error
]

{ #category : 'createValueWith' }
CallStackJsonReaderTest >> testCreateValueWithEmptyDictionary [

	self should: [ reader createValueWith: Dictionary new ] raise: Error
]

{ #category : 'createValueWith' }
CallStackJsonReaderTest >> testCreateValueWithPrimitiveType [
	"Smoke test, we just check if CreateValue hold with a primitive type"

	reader createValueWith: CSStructureCreator simplePrimitiveValueDict 
]

{ #category : 'createValueWith' }
CallStackJsonReaderTest >> testCreateValueWithReference [
	"Smoke test, we just check if createValueWith: hold with an ArrayReference"

	reader createValueWith: CSStructureCreator simpleArrayReferenceDict
]

{ #category : 'fillValueCheckingMaxDepth' }
CallStackJsonReaderTest >> testfillValueCheckingMaxDepthAtMaxDepth [
	| aField |
	aField := reader model newField.
	reader fillValueCheckingMaxDepthOn: aField with: '<<MAX_DEPTH_REACHED>>'.

	self assert: aField isAtMaxDepth 
]

{ #category : 'fillValueCheckingMaxDepth' }
CallStackJsonReaderTest >> testfillValueCheckingMaxDepthWithNil [

	| aField |
	aField := reader model newField.
	reader fillValueCheckingMaxDepthOn: aField with: nil.

	self assert: aField value isNil
]

{ #category : 'fillValueCheckingMaxDepth' }
CallStackJsonReaderTest >> testfillValueCheckingWithAString [
	| aField |
	aField := reader model newField.
	self should:[reader fillValueCheckingMaxDepthOn: aField with: 'imJustAString'] raise: Error.
	self should:[reader fillValueCheckingMaxDepthOn: aField with: '<<imJustAString>>'] raise: Error.

	
]

{ #category : 'instantiateReferenceEntity' }
CallStackJsonReaderTest >> testinstantiateReferenceEntityAClassReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (CSStructureCreator simpleObjectReferenceDict at:#reference).

	self assert: reference isClassReference.
	self assert: (reader model includes: reference)
]

{ #category : 'instantiateReferenceEntity' }
CallStackJsonReaderTest >> testinstantiateReferenceEntityAClassReferenceNotPrepared [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (Dictionary new
			              at: #refered put: '<<CLASS_NOT_PREPARED>>';
			              yourself).

	self assert: reference isClassReference.
	self assert: (reader model includes: reference)
]

{ #category : 'instantiateReferenceEntity' }
CallStackJsonReaderTest >> testinstantiateReferenceEntityAStringReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (CSStructureCreator simpleStringReferenceDict at:#reference).

	self assert: reference isStringReference.
	self assert: (reader model includes: reference)
]

{ #category : 'instantiateReferenceEntity' }
CallStackJsonReaderTest >> testinstantiateReferenceEntityArrayReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (CSStructureCreator simpleArrayReferenceDict at:#reference).

	self assert: reference isArrayReference.
	self assert: (reader model includes: reference)
]
