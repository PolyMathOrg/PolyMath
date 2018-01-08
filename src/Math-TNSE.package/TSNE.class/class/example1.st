examples
example1
	| points |
	points := self gridDataGeneratorOf: 10.
	^ (self new)
		perplexity: 10;
		x: points;
		initialDims: 2;
		epsilon: 5;
		run;
		y