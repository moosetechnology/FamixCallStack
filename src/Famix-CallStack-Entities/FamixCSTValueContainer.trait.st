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
| `maxDepthReached` | `Boolean` | false | |
| `unAccesssible` | `Boolean` | false | |

"
Trait {
	#name : 'FamixCSTValueContainer',
	#instVars : [
		'#maxDepthReached => FMProperty defaultValue: false',
		'#unAccesssible => FMProperty defaultValue: false',
		'#value => FMOne type: #FamixCSValue opposite: #usage'
	],
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
FamixCSTValueContainer >> unAccesssible [

	<FMProperty: #unAccesssible type: #Boolean defaultValue: false>
	<generated>
	^ unAccesssible ifNil: [ unAccesssible := false ]
]

{ #category : 'accessing' }
FamixCSTValueContainer >> unAccesssible: anObject [
	<generated>
	unAccesssible := anObject
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
