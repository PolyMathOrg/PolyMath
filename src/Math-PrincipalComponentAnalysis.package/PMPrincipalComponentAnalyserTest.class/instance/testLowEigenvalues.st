tests
testLowEigenvalues
	"this is a test without using the class API."

	| jacobi actual expected |
	jacobi := PMJacobiTransformation matrix: covarianceMatrix.
	actual := jacobi evaluate.
	expected := #(3.623277676214216e7 766.1878578405343 -8.608930577556605e-13 2.1213150252733508e-13 -1.9556315119125588e-13) asPMVector.
	actual - expected do: [ :each | self assert: each < 10e-8 ]