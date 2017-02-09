iterative algorithms
testIntegrationRomberg
	| integrator ln2 ln3 |
	integrator := PMRombergIntegrator
		function: [ :x | 1.0 / x ]
		from: 1
		to: 2.
	ln2 := integrator evaluate.
	integrator from: 1 to: 3.
	ln3 := integrator evaluate.
	self assert: (2.0 ln - ln2) abs < (2 * integrator precision).
	self assert: (3.0 ln - ln3) abs < (2 * integrator precision)