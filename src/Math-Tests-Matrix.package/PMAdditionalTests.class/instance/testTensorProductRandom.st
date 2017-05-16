tests
testTensorProductRandom
	"this tests if a tensor product of two randomly initialized vectors is calculated correctly"

	| random a b expected |
	random := Random new.
	
	a := { random next . random next } asPMVector.
	b := { random next . random next } asPMVector.
	
	"tensor product of two different vectors (a PMMatrix)"
	expected := PMMatrix rows: (
		a collect: [ :x | 
			b collect: [ :y | x * y ]] ).
		
	self assert: (a tensorProduct: b) equals: expected.
	
	"tensor product of two equal vectors (a PMSymmetricMatrix)"
	expected := PMMatrix rows: (
		a collect: [ :x | 
			a collect: [ :y | x * y ]] ).
		
	self assert: (a tensorProduct: a) equals: expected.