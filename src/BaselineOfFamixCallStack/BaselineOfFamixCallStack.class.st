Class {
	#name : 'BaselineOfFamixCallStack',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixCallStack',
	#package : 'BaselineOfFamixCallStack'
}

{ #category : 'baselines' }
BaselineOfFamixCallStack >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				package: 'Famix-CallStack';
				package: 'Famix-CallStack-Entities';
				package: 'Famix-CallStack-Importer'  with: [spec requires: 'Famix-CallStack-Entities']]
]
