as yet unclassified
stepper: anImplicitStepper 
	stepper := anImplicitStepper.
	system notNil ifTrue: [stepper system: system].