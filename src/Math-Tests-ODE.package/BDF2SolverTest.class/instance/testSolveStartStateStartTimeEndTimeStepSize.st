as yet unclassified
testSolveStartStateStartTimeEndTimeStepSize
	| solver stepper system dt finalState |
	dt := 0.2.
	system := ImplicitSystem block: [:x :t | (t * x ) exp].
	stepper := ImplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := (BDF2Solver new 
				system: system; 
				stepper: stepper).
	finalState := solver solve: solver system startState: 0 startTime: 0  endTime: 1 stepSize: dt. 
	self should: [finalState isFloat].
	
	"Debgging information"
	Transcript 
		show: self class name asByteString;  cr; 
		show: system block asText ; cr;
		show: 'from x(0) = 0 to x(1) = ';
		show: finalState; cr;
		show: 'with stepSize = ', solver dt printString; cr.