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
				package: 'Famix-CallStack-Generator';
				package: 'Famix-CallStack-Entities';
				package: 'Famix-CallStack-Entities-Extensions' with: [ spec requires: 'Famix-CallStack-Entities' ];
				package: 'Famix-CallStack-Importer'
				with: [ spec requires: #( 'Famix-CallStack-Entities' 'Famix-CallStack-Entities-Extensions' ) ];
				package: 'Famix-CallStack-Entities-Tests'
				with: [ spec requires: #( 'Famix-CallStack-Entities' 'Famix-CallStack-Entities-Extensions' ) ];
				package: 'Famix-CallStack-Importer-Tests' with: [ spec requires: 'Famix-CallStack-Importer' ] ]
]
