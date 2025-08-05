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


## Usage

### Import metamodel 
- Programmatically (here the extension .cs of the file isn't important, having a .json works as well):
```smalltalk

file := '/Path/To/.../JDIOutput.cs' asFileReference.

model := CallStackJsonReader import: file.
```

- With drag and drops :  
Just drag the file "JDIOutput.cs" and drop it on your Moose image (here the extension .cs is really important, without it the importation will fail)


