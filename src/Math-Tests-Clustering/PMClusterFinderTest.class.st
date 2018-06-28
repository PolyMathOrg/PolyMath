Class {
	#name : #PMClusterFinderTest,
	#superclass : #TestCase,
	#instVars : [
		'dataServer'
	],
	#category : 'Math-Tests-Clustering'
}

{ #category : #utils }
PMClusterFinderTest >> accumulateAround: aVector size: aNumber into: aCollection [
	"Private - Generate a random point around the given center and insert it into the collection.
	aNumber is the sigma for the distance to the center"
	
	| r phi psi localVector |
	r := (PMNormalDistribution new: 0 sigma: aNumber) random.
	phi := Float pi random.
	psi := Float pi random.
	localVector := PMVector new: 3.
	localVector at: 1 put: ( phi sin * psi sin * r );
					   at: 2 put: ( phi cos * psi sin * r );
					   at: 3 put: ( psi cos * r ).
	aCollection add: (localVector + aVector).
]

{ #category : #utils }
PMClusterFinderTest >> generatedPoints: anInteger [
	"Private - Generate random points into aCollection. 3 clusters are used"
	| centers results |
	centers := Array new: 3.
	centers at: 1 put: #( 200 200  200) asPMVector;
				 at: 2 put: #(-200 200  200) asPMVector;
				 at: 3 put: #( 200 200 -200) asPMVector.
	results := OrderedCollection new.
	PMMitchellMooreGenerator reset: 6.
		"make tests non-random to make sure that they will not fail on the integrator server."
	anInteger timesRepeat: [ self accumulateAround: ( centers at: (3 random + 1)) size: 1 into: results ].
	^results
]

{ #category : #setUp }
PMClusterFinderTest >> setUp [


	dataServer := PMMemoryBasedDataServer new.
	dataServer data: (self generatedPoints: 1000).
	
]

{ #category : #tests }
PMClusterFinderTest >> testClusterCovariance [

	| clusters finder |
	finder := PMClusterFinder new: 5 server: dataServer type: PMCovarianceCluster.
	finder minimumRelativeClusterSize: 0.1.
	clusters := finder evaluate.
	self assert: clusters size equals: 3
]

{ #category : #tests }
PMClusterFinderTest >> testClusterEuclidean [

	| clusters finder |
	finder := PMClusterFinder new: 5 server: dataServer type: PMEuclideanCluster.
	finder minimumRelativeClusterSize: 0.15.
	clusters := finder evaluate.
	self assert: clusters size equals: 3
]

{ #category : #tests }
PMClusterFinderTest >> testMahalanobisCenter [
	"Code example 12.5"
	| center distance|
	center := PMMahalanobisCenter new: 3.
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
		do: [ :x | center accumulate: x asPMVector].
	center computeParameters.
	distance := center distanceTo: #(1 2 3) asPMVector.
	self assert:  (distance equalsTo: 2.26602282704126)
]
