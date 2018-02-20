as yet unclassified
computePairwiseDistances
	| sumX d tmp|
	sumX := (x dot: x) sum.
	tmp := (x * (x transpose)) * (-2).
	tmp := PMMatrix rows: (tmp rowsCollect: [ :each| each + sumX ]).
	d := PMMatrix rows: ((tmp transpose) rowsCollect: [:each| each + sumX]).
	^ d