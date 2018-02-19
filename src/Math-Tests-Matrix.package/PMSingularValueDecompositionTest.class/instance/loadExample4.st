as yet unclassified
loadExample4
	"Rectangular matrix with real values"
		
	matrix := PMMatrix rows: #(
		(1 0 0 0 2)
		(0 0 3 0 0)
		(0 0 0 0 0)
		(0 2 0 0 0)).
		
	actualU := PMMatrix rows: #(
		(0 0 1 0)
		(0 1 0 0)
		(0 0 0 -1)
		(1 0 0 0)).
		
	actualV := PMMatrix rows: { 
		{ 0 . 0 . 0.2 sqrt . 0 . -1 * (0.8 sqrt) } .
		{ 1 . 0 . 0 . 0 . 0 } .
		{ 0 . 1 . 0 . 0 . 0 } .
		{ 0 . 0 . 0 . 1 . 0 } .
		{ 0 . 0 . 0.8 sqrt . 0 . 0.2 sqrt } }.
		
	actualS := PMMatrix rows: {
		{ 2 . 0 . 0 . 0 . 0 } .
		{ 0 . 3 . 0 . 0 . 0 } .
		{ 0 . 0 . 5 sqrt . 0 . 0 } .
		{ 0 . 0 . 0 . 0 . 0 } }.