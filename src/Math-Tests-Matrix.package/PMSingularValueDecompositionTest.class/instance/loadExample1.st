as yet unclassified
loadExample1
	"Simple example. Square matrix with real values"
		
	matrix := PMMatrix rows: #(
		(0 4)
		(0 0)).
		
	actualU := PMMatrix rows: #(
		(1 0)
		(0 1)).
		
	actualV := PMMatrix rows: #(
		(0 1)
		(1 0)).
		
	actualS := PMMatrix rows: #(
		(4 0)
		(0 0)).