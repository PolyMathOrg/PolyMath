iterative algorithms
testIntegrationSimpson

	| integrator ln2 ln3|
	integrator := DhbSimpsonIntegrator function: [ :x | 1.0 / x] from: 1 to: 2.
	ln2 := integrator evaluate.
	integrator from: 1 to: 3.
	ln3 := integrator evaluate.
	self should: [ ( 2.0 ln - ln2) abs < integrator precision].
	self should: [ ( 3.0 ln - ln3) abs < integrator precision].