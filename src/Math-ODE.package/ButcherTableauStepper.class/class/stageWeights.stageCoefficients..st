instance creation
stageWeights: anArray stageCoefficients: aMatrix
	| c |
	"stageWeights is the array b, stageCoefficients is the lower triangular matrix A"
	self assert: [anArray sum = 1].
	"we can calculate the stage increments from the coefficient matrix"
	c := Array new: anArray size.
	(1 to: c size) do: [:i | 
		c at: i put: ((aMatrix rowAt: i) sum)].
	
	^ self new stageIncrements: c;
		 stageCoefficients: aMatrix;
		stageWeights: anArray;
		yourself.