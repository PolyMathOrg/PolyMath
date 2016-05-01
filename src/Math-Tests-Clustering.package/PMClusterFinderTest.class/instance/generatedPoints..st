utils
generatedPoints: anInteger
	"Private - Generate random points into aCollection. 3 clusters are used"
	| centers results |
	centers := Array new: 3.
	centers at: 1 put: #( 200 200  200) asDhbVector;
				 at: 2 put: #(-200 200  200) asDhbVector;
				 at: 3 put: #( 200 200 -200) asDhbVector.
	results := OrderedCollection new.
	DhbMitchellMooreGenerator reset: 6.
		"make tests non-random to make sure that they will not fail on the integrator server."
	anInteger timesRepeat: [ self accumulateAround: ( centers at: (3 random + 1)) size: 1 into: results ].
	^results