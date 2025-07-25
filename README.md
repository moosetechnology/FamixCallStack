# FamixCallStack

This project offers a metamodel for Java call stacks, enabling dynamic analysis of Java applications directly within Moose.

This project can imports file created with a parser of java call stacks found at : https://github.com/LeoDefossez/JavaCallStackExtractor

To load in a Moose image, execute: 
```Smalltalk
Metacello new
  baseline: 'FamixCallStack';
  repository: 'github://LeoDefossez/FamixCallStack/src';
  load.
```


## Usage :

Import metamodel :
```smalltalk

file := '/Path/To/.../JDIOutput.cs' asFileReference.

model := CallStackJsonReader import: file.
```
