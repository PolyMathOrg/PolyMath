accessing
stepper: aStepper 
	stepper := aStepper.
	system notNil ifTrue: [stepper system: system].