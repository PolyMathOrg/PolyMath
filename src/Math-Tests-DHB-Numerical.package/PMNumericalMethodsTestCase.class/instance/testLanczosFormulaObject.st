function evaluation
testLanczosFormulaObject
	"verify that initialize is sent at least once per test run"

	| first second third |
	first := PMLanczosFormula new.
	PMLanczosFormula reset.
	second := PMLanczosFormula new.
	self shouldnt: [ first == second ].
	third := PMLanczosFormula new.
	self assert: second == third