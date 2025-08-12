"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixCSTValueContainer` | `usage` | `FamixCSValue` | |



"
Trait {
	#name : 'FamixCSTValueContainer',
	#instVars : [
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
