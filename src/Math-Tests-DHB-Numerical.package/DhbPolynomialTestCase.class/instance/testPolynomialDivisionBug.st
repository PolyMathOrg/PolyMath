function evaluation
testPolynomialDivisionBug
	"identify an error when trying to create a zero dividend"
	| pol1 pol2 polynomial |
	pol1 := PMPolynomial coefficients: #(2 -3 1).
	pol2 := PMPolynomial coefficients: #(-6 23 -20 3 -1 1).
	self shouldnt: [polynomial := pol1 / pol2] raise: Error.
	