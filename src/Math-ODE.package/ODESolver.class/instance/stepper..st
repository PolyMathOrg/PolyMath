accessing
stepper: anExplicitStepper 
	stepper := anExplicitStepper.
	system notNil ifTrue: [stepper system: system].