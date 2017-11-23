initialization
exampleSize: anInteger
	"initializes a new distribution"

	| p q |
	a := 0.003326 - (6.012 / anInteger) + (5.52 / (anInteger raisedTo: 0.53)).
	b := -0.0004245 - (0.003397 / anInteger) + (0.3204 / (anInteger raisedTo: 0.48)).
	p := 3.258 - (3.727 / anInteger) + (4.607 / (anInteger raisedTo: 1.6)).
	q := 25 - (161.2 / anInteger) + (162.2 / (anInteger raisedTo: 1.3)).
	distribution := PMBetaDistribution shape: p shape: q.
	^ n := anInteger