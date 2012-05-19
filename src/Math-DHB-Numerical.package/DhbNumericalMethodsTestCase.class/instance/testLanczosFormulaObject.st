function evaluation
testLanczosFormulaObject
	"verify that initialize is sent at least once per test run"
	| first second third |
	first := DhbLanczosFormula new.
	DhbLanczosFormula reset.
	second := DhbLanczosFormula new.
	self shouldnt: [first == second].
	third := DhbLanczosFormula new.
	self should: [second == third].