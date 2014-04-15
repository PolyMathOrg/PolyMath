data mining
testCovarianceAccumulation
	"Code example 12.2"
	| accumulator average covarianceMatrix |
	accumulator := DhbCovarianceAccumulator new: 3.
	#( 
			(1 2 3)
			( 2 3 4)
			( 1 3 2)
			( 4 3 1)
			( 1 3 1)
			( 1 4 2)
			( 3 1 2)
			( 3 4 2)
		)
	do: [ :x | accumulator accumulate: x asDhbVector].
	average := accumulator average.
	self should: [ ( average at: 1) equalsTo: 2.0].
	self should: [ ( average at: 2) equalsTo: 2.875].
	self should: [ ( average at: 3) equalsTo: 2.125].
	covarianceMatrix := accumulator covarianceMatrix.
	self should: [ ((covarianceMatrix rowAt: 1) at: 1) equalsTo: 1.25].
	self should: [ ((covarianceMatrix rowAt: 1) at: 2) equalsTo: -0.125].
	self should: [ ((covarianceMatrix rowAt: 2) at: 1) equalsTo: -0.125].
	self should: [ ((covarianceMatrix rowAt: 1) at: 3) equalsTo: -0.25].
	self should: [ ((covarianceMatrix rowAt: 3) at: 1) equalsTo: -0.25].
	self should: [ ((covarianceMatrix rowAt: 2) at: 2) equalsTo: 0.859375].
	self should: [ ((covarianceMatrix rowAt: 2) at: 3) equalsTo: -0.109375].
	self should: [ ((covarianceMatrix rowAt: 3) at: 2) equalsTo: -0.109375].
	self should: [ ((covarianceMatrix rowAt: 3) at: 3) equalsTo: 0.859375].