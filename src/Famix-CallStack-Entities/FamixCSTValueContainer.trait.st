"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `accessible` | `Boolean` | true | |
| `maxDepthReached` | `Boolean` | false | |

"
Trait {
	#name : 'FamixCSTValueContainer',
	#instVars : [
		'#accessible => FMProperty defaultValue: true',
		'#maxDepthReached => FMProperty defaultValue: false',
		'#value => FMOne type: #FamixCSValue opposite: #usage'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : 'Famix-CallStack-Entities-Traits',
	#package : 'Famix-CallStack-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixCSTValueContainer classSide >> annotation [

	<FMClass: #TValueContainer super: #Object>
	<package: #'Famix-Callstack-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixCSTValueContainer >> accessible [

	<FMProperty: #accessible type: #Boolean defaultValue: true>
	<generated>
	^ accessible ifNil: [ accessible := true ]
]

{ #category : 'accessing' }
FamixCSTValueContainer >> accessible: anObject [
	<generated>
	accessible := anObject
]

{ #category : 'accessing' }
FamixCSTValueContainer >> maxDepthReached [

	<FMProperty: #maxDepthReached type: #Boolean defaultValue: false>
	<generated>
	^ maxDepthReached ifNil: [ maxDepthReached := false ]
]

{ #category : 'accessing' }
FamixCSTValueContainer >> maxDepthReached: anObject [
	<generated>
	maxDepthReached := anObject
]

{ #category : 'accessing' }
FamixCSTValueContainer >> value [
	"Relation named: #value type: #FamixCSValue opposite: #usage"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixCSTValueContainer >> value: anObject [

	<generated>
	value := anObject
]
