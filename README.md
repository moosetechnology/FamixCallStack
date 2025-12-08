# FamixCallStack

This project offers a metamodel for Java call stacks, enabling dynamic analysis of Java applications directly within Moose.

This project can imports file created with the [JavaCallStackExtractor](https://github.com/moosetechnology/JavaCallStackExtractor) project.

## Loading the project into Moose
To load FamixCallStack into a Moose image, execute the following code:
```Smalltalk
Metacello new
  baseline: 'FamixCallStack';
  repository: 'github://moosetechnology/FamixCallStack/src';
  load.
```


## Usage

### Importing a Call Stack Model
You can import a call stack in two ways:
#### 1. Programmatically
The file extension .cs is not strictly required, a .json would also work:
```smalltalk
file := '/Path/To/.../JDIOutput.cs' asFileReference.
model := CallStackJsonReader import: file.
```
#### 2. With drag and drops
Simply drag the JDIOutput.cs file onto your Moose image.  
**Note:** In this case, the file must have a .cs extension, otherwise, the import will fail.

