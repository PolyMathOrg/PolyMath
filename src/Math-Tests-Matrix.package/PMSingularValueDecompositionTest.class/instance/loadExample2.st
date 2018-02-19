as yet unclassified
loadExample2
	"Simple example. Square matrix with real values"
		
	matrix := PMMatrix rows: #(
		(0 1 0 0)
		(0 0 2 0)
		(0 0 0 3)
		(0 0 0 0)).
		
	actualU := PMMatrix rows: #(
		(0 0 1 0)
		(0 1 0 0)
		(1 0 0 0)
		(0 0 0 1)).
		
	actualV := PMMatrix rows: #(
		(0 0 0 1)
		(0 0 1 0)
		(0 1 0 0)
		(1 0 0 0)).
		
	actualS := PMMatrix rows: #(
		(3 0 0 0)
		(0 2 0 0)
		(0 0 1 0)
		(0 0 0 0)).