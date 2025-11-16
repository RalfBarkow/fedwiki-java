Class {
	#name : #BaselineOfFedwikiJava,
	#superclass : #BaselineOf,
	#category : #BaselineOfFedwikiJava
}

{ #category : #baseline }
BaselineOfFedwikiJava >> baseline: spec [
	<baseline>
	^ spec for: #common do: [ spec package: 'FedwikiJava' ]
]
