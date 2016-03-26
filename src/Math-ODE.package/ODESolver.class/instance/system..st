accessing
system: aSystem 
	system := aSystem.
	stepper notNil ifTrue: [stepper system: aSystem].