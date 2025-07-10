Class {
	#name : 'BaselineOfFamixCallstack',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixCallstack',
	#package : 'BaselineOfFamixCallstack'
}

{ #category : 'baselines' }
BaselineOfFamixCallstack >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				package: 'Famix-CallStack';
				package: 'Famix-CallStack-Entities' ]
]
