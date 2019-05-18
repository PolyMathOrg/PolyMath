"
Implementation of t-SNE (t-Distributed Stochastic Neighbor Embedding) algorithm

https://lvdmaaten.github.io/tsne/

t-SNE is a technique for dimensionality reduction that is particularly well suited for the visualization of high-dimensional datasets.
"
Class {
	#name : #PMTSNE,
	#superclass : #Object,
	#instVars : [
		'outputDims',
		'initialDims',
		'perplexity',
		'x',
		'y',
		'maxIter',
		'epsilon',
		'sumY',
		'initialMomentum',
		'finalMomentum',
		'eta',
		'minGain'
	],
	#category : #'Math-TSNE'
}

{ #category : #running }
PMTSNE class >> entropyOf: distanceVector andPRow: pVector withBeta: beta [
	"Calculates gaussian kernel values for a distanceVector, along with perplexity
	 Inputs: distanceVector - a PMVector containing distances
				pRow - calculated p-rows are stored here
				beta - a Float, precision which is used to compute entropy
	 Outputs: entropy - log(Shannon's entropy) for calculated pVector
				 pVector - The conditional probability pji
	"

	| pVectorTemp sumP entropy |
	pVectorTemp := (-1 * distanceVector * beta) exp.
	sumP := pVectorTemp sum max: (Float epsilon).
	entropy := sumP ln + (beta * (distanceVector * pVectorTemp) / sumP).
	pVector copyFrom: (pVectorTemp / sumP).
	^ entropy
]

{ #category : #examples }
PMTSNE class >> example1 [
	| points |
	points := self gridDataGeneratorOf: 10.
	^ (self new)
		perplexity: 10;
		x: points;
		initialDims: 2;
		epsilon: 5;
		start;
		y
]

{ #category : #'as yet unclassified' }
PMTSNE class >> gridDataGeneratorOf: size [
	"Demos from https://github.com/distillpub/post--misread-tsne/blob/master/public/assets/demo-configs.js"
	"A square grid with equal spacing between points."
	"Returns a PMMatrix"
	
	| array i |
	array := Array new: size*size. 
	i := 1.
	1 to: size do: [ :x | 1 to: size do: [ :y | array at: i  put: {x. y.}.
														i:=i+1] ].
	^ PMMatrix rows: array
]

{ #category : #'as yet unclassified' }
PMTSNE >> computeLowDimensionalAffinities [
"
	sum_Y = np.sum(np.square(Y), 1);
		num = 1 / (1 + Math.add(Math.add(-2 * Math.dot(Y, Y.T), sum_Y).T, sum_Y));
		num[range(n), range(n)] = 0;
		Q = num / Math.sum(num);
		Q = Math.maximum(Q, 1e-12);"
		|num tmp|
	sumY :=  (x dot:x) sum. "PMVector"
	tmp := ((y* (y transpose)) * (-2)) transpose.
	num := ((PMMatrix rows: (tmp rowsCollect: [ :each| each + sumY])) ).
	
	
		
	
]

{ #category : #accessing }
PMTSNE >> computePValues [
"
#Compute P-values
	P = x2p(X, 1e-5, perplexity);
	P = P + Math.transpose(P);
	P = P / Math.sum(P);
	P = P * 4;									# early exaggeration
	P = Math.maximum(P, 1e-12);
"
| p n |
p := self computePairwiseAffinities.
p := p + p transpose.
p := p / (p sum).
p := p *4.
p := p max: 1e-12.
^ p
]

{ #category : #running }
PMTSNE >> computePairwiseAffinities [
	"Computes a similarity matrix by making sure each Gaussian has same perplexity.
	It identifies required precision (beta = (1/ variance**2)) for each row using a
	binary search. The precision is selected based on input perplexity.
	"
	
	| p d beta logU n betaMin betaMax distanceVector pVector entropy tries entropyDiff |
	n := x numberOfRows.
	d := self computePairwiseDistances.
	p := PMMatrix zerosRows: n cols: n.
	beta := PMVector ones: n.
	logU := self perplexity ln.
	distanceVector := PMVector new: n - 1.
	pVector := PMVector new: n - 1.
	1 to: n do: [ :i |
		"Set minimum and maximum value of precision"
		betaMin := Float infinity negated.
		betaMax := Float infinity.
		
		"Ignore i-th element of the row d[i] and copy rest in distanceVector.
		 Also initialize pVector to 0"
		1 to: n do: [ :index |
			(index = i) ifFalse: [ 
				(index < i)
					ifTrue: [ distanceVector at: index put: (d rowAt: i columnAt: index).
								 pVector at: index put: 0. ]
					ifFalse: [ distanceVector at: (index - 1) put: (d rowAt: i columnAt: index).
								  pVector at: (index - 1) put: 0.].
				 ].
			].
		entropy := self class entropyOf: distanceVector andPRow: pVector withBeta: (beta at: i).
		entropyDiff := entropy - logU.
		tries := 0.
		[ (entropyDiff abs > 1e-5) & (tries < 50)]	whileTrue: [ 
			(entropyDiff > 0)
				ifTrue: [ 
					betaMin := beta at: i.
					((betaMax = Float infinity) | (betaMin = Float infinity negated))
						ifTrue: [ beta at: i put: ((beta at: i) * 2) ]
						ifFalse: [ beta at: i put: (((beta at: i) + betaMax) / 2)
						].
					 ]
				ifFalse: [ 
					betaMax := beta at: i.
					((betaMax = Float infinity) | (betaMin = Float infinity negated))
						ifTrue: [ beta at: i put: ((beta at: i) / 2) ]
						ifFalse: [ beta at: i put: (((beta at: i) + betaMin) / 2)
						].
					].
				entropy := self class entropyOf: distanceVector andPRow: pVector withBeta: (beta at: i).
				entropyDiff := entropy - logU.
				tries := tries + 1.
		 	].
		1 to: n do: [ :index |
			(index = i) ifFalse: [
				(index < i)
					ifTrue: [ p rowAt: i columnAt: index put: (pVector at: index) ]
					ifFalse: [ p rowAt: i columnAt: index put: (pVector at: index - 1) ].
				].
			 ].
		 ].
	^ p
]

{ #category : #'as yet unclassified' }
PMTSNE >> computePairwiseDistances [
	| sumX d tmp|
	sumX := (x dot: x) sum.
	tmp := (x * (x transpose)) * (-2).
	tmp := PMMatrix rows: (tmp rowsCollect: [ :each| each + sumX ]).
	d := PMMatrix rows: ((tmp transpose) rowsCollect: [:each| each + sumX]).
	^ d
]

{ #category : #running }
PMTSNE >> epsilon: aFloat [
	epsilon := aFloat
]

{ #category : #accessing }
PMTSNE >> initialDims [
	^ initialDims 
]

{ #category : #accessing }
PMTSNE >> initialDims: aFloat [
	initialDims := aFloat
]

{ #category : #accessing }
PMTSNE >> initialDimsDefaultValue [
	^ 50
]

{ #category : #initialization }
PMTSNE >> initialize [
	maxIter := 1000.
	initialMomentum := 0.5.
	finalMomentum := 0.8.
	eta := 500.
	minGain := 0.01.
	
]

{ #category : #initialization }
PMTSNE >> initializeUninitializedParameters [
	perplexity ifNil: [ perplexity := self perplexityDefaultValue ].
	outputDims ifNil: [ outputDims := self outputDimsDefaultValue ].
	initialDims ifNil: [ initialDims := self initialDimsDefaultValue ]
]

{ #category : #initialization }
PMTSNE >> initializeYWithRandomValues [
	"Answer a new Matrix Y with the number of rows of x and number of columns ndims filled with random numbers following a normal distribution (0,1)"
	"We should add this to PMMatrix API later"

	| a b rows columns d |
	rows := x dimension x.
	columns := outputDims.
	d := PMNormalDistribution new:0 sigma: 1.
	a := (1 to: rows)
		collect: [ :row | 
			b := PMVector new: columns.
			1 to: columns do: [ :column | b at: column put: d random ].
			b ].
	y := PMMatrix rows: a
]

{ #category : #accessing }
PMTSNE >> outputDims [
	^ outputDims
]

{ #category : #accessing }
PMTSNE >> outputDims: anInteger [
	outputDims := anInteger
]

{ #category : #accessing }
PMTSNE >> outputDimsDefaultValue [
	^ 2
]

{ #category : #accessing }
PMTSNE >> perplexity [
	^ perplexity
]

{ #category : #accessing }
PMTSNE >> perplexity: aFloat [
	perplexity := aFloat
]

{ #category : #'as yet unclassified' }
PMTSNE >> perplexityDefaultValue [
	^ 30.0
]

{ #category : #running }
PMTSNE >> reduceXToInputDims [
	"Runs PCA on X in order to reduce its dimensionality to initialDims dimensions."

	self reduceXToInputDimsUsing: PMPrincipalComponentAnalyserJacobiTransformation.
]

{ #category : #running }
PMTSNE >> reduceXToInputDimsUsing: aClass [
	"Runs aClass PCA on X in order to reduce its dimensionality to initialDims dimensions."

	| scaler pca |
	scaler := PMStandardizationScaler new.
	initialDims ifNil: [ initialDims := self initialDimsDefaultValue ].
	pca := aClass new componentsNumber: (initialDims min: x dimension y).
	x := pca fitAndTransform: (scaler fitAndTransform: x)
]

{ #category : #accessing }
PMTSNE >> start [
	self initializeUninitializedParameters.
	self reduceXToInputDims.
	self initializeYWithRandomValues.
	self computePairwiseAffinities
]

{ #category : #'stepping and presenter' }
PMTSNE >> step [
	self computeLowDimensionalAffinities
]

{ #category : #accessing }
PMTSNE >> x [
	^ x
]

{ #category : #accessing }
PMTSNE >> x: aPMMatrix [
	x := aPMMatrix
]

{ #category : #accessing }
PMTSNE >> y [
	^ y
]
