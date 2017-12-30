tests
testTensorProduct
	"this tests if a tensor product of two vectors is calculated correctly"

	| a b expected |
	a := #(3 4) asPMVector.
	b := #(1 2) asPMVector.
	
	"tensor product of two different vectors (a PMMatrix)"
	expected := PMMatrix rows: #((3 6)(4 8)).
	self assert: (a tensorProduct: b) equals: expected.
	
	"tensor product of two equal vectors (a PMSymmetricMatrix)"
	expected := PMMatrix rows: #((9 12)(12 16)).
	self assert: (a tensorProduct: a) equals: expected.