tests
testSystem
	| stepper sys |
	sys := ExplicitSystem new.
	sys block: [ :x :t | t ].
	stepper := Stepper onSystem: sys.
	self assert: stepper system equals: sys.
	sys := ExplicitSystem new.
	self shouldnt: [ stepper system = sys ]