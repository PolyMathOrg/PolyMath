as yet unclassified
stepper: anExplicitStepper 
	stepper := anExplicitStepper.
	system notNil ifTrue: [stepper system: system].