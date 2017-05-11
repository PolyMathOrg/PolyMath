transformation
cumsum
	"Computes the cumulative sum for each row."

	^ PMMatrix rows: (rows collect: [ :each | each cumsum ])