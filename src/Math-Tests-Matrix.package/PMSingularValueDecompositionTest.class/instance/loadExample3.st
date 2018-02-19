as yet unclassified
loadExample3
	"Rectangular matrix with real values"
		
	matrix := PMMatrix rows: #(
		(-1 1 0)
		(0 -1 1)).
		
	actualU := PMMatrix rows: { 
		{ -1 / (2 sqrt) . 1 / (2 sqrt) } .
		{ 1 / (2 sqrt) . 1 / (2 sqrt) } }.
		
	actualV := PMMatrix rows: { 
		{ 1 / (6 sqrt) . -1 / (2 sqrt) . 1 / (3 sqrt) } .
		{ -2 / (6 sqrt) . 0 . 1 / (3 sqrt) } .
		{ 1 / (6 sqrt) . 1 / (2 sqrt) . 1 / (3 sqrt) } }.
		
	actualS := PMMatrix rows: {
		{ 3 sqrt . 0 . 0} .
		{0 . 1 . 0}}.