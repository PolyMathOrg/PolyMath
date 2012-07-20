accessing
system: anExplicitSystem 
	system := anExplicitSystem.
	stepper notNil ifTrue: [stepper system: anExplicitSystem].