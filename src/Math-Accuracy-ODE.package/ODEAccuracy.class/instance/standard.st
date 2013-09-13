as yet unclassified
standard
	standard ifNil: [ 
		standard := [:x | (x ** 5) * (x sin ** (2*x cos)) ] value: endTime ].
	^ standard 