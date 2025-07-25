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
				package: 'Famix-Callstack';
				package: 'Famix-Callstack-Entities';
				package: 'Famix-Callstack-Importer'  with: [spec requires: 'Famix-Callstack-Entities']]
]
