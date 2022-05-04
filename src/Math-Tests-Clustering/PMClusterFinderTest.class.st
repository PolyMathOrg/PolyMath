Class {
	#name : #PMClusterFinderTest,
	#superclass : #TestCase,
	#instVars : [
		'dataServer',
		'randomNumberGenerator'
	],
	#category : #'Math-Tests-Clustering'
}

{ #category : #utils }
PMClusterFinderTest >> accumulateAround: aVector size: aNumber into: aCollection [
	"Private - Generate a random point around the given center and insert it into the collection.
	aNumber is the sigma for the distance to the center"
	
	| r phi psi localVector |
	
	r := randomNumberGenerator nextBetween: -1 * aNumber and: aNumber.
	phi := randomNumberGenerator nextBetween: 0 and: Float pi.
	psi := randomNumberGenerator nextBetween: 0 and: Float pi.
	
	localVector := PMVector new: 3.
	localVector
		at: 1 put: (phi sin * psi sin * r);
		at: 2 put: (phi cos * psi sin * r);
		at: 3 put: (psi cos * r).
		
	aCollection add: (localVector + aVector).
]

{ #category : #utils }
PMClusterFinderTest >> generatedPoints: anInteger [
	"Private - Generate random points into aCollection. 3 clusters are used"
	| centers results randomNumber |
	
	centers := {
		#( 200 200  200) asPMVector .
		#(-200 200  200) asPMVector .
		#( 200 200 -200) asPMVector }.
		
	results := OrderedCollection new.
	
	anInteger timesRepeat: [
		randomNumber := randomNumberGenerator nextIntegerBetween: 1 and: 3.
		self accumulateAround: (centers at: randomNumber) size: 1 into: results ].
	
	^ results
]

{ #category : #setUp }
PMClusterFinderTest >> setUp [
	super setUp.
	randomNumberGenerator := Random seed: 3.
	
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
