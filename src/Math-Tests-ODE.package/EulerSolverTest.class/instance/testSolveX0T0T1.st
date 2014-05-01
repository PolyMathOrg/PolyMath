tests-solving
testSolveX0T0T1
	| solver stepper system dt finalState |
	dt := 0.1.
	system := ExplicitSystem block: [:x :t | (t * x ) exp].
	stepper := ExplicitStepper onSystem: system.
	stepper stepSize: dt.
	solver := (ExplicitSolver new 
				system: system; 
				stepper: stepper;
				dt: dt).
	finalState := solver solve: solver system startState: 0 startTime: 0  endTime: 1. 
	self should: [finalState isFloat].
	
	"Debgging information"
	Transcript 
		show: self class name;  cr; 
		show: system block printString; cr;
		show: 'from x(0) = 0 to x(1) = ';
		show: finalState; cr;
		show: 'with stepSize = ', solver dt printString; cr.