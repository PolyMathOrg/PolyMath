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
		'sumY',
		'initialMomentum',
		'finalMomentum',
		'learningRate',
		'minGain',
		'job',
		'computeErrorEvery'
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

{ #category : #accessing }
PMTSNE >> computeErrorEvery [
	^ computeErrorEvery 
]

{ #category : #accessing }
PMTSNE >> computeErrorEvery: aNumber [
	computeErrorEvery := aNumber
]

{ #category : #accessing }
PMTSNE >> computeErrorEveryDefaultValue [
	^ 10
]

{ #category : #'stepping and presenter' }
PMTSNE >> computeGradient: p withProgressUpdate: iteration [
	"Computes gradient of KL divergence"

	| num sumNum q pq dY tmp yiDiff error |
	"Calculates num and q"
	num := self computeLowDimensionalStudentT.
	sumNum := num sum sum max: (Float epsilon).
	q := num collect: [:element |
				(element / sumNum) max: (Float epsilon)
			].
	pq := p - q.
	dY := OrderedCollection new. 
	1 to: (x dimension x) do: [ :i |
		tmp := (pq rowAt: i) hadamardProduct: (num rowAt: i).
		"Create a matrix of rows filled with 'tmp'"
		tmp := (PMMatrix rows: ((1 to: outputDims) collect: [ :j | tmp])).
		yiDiff := (PMMatrix rows: (y rowsCollect: [ :row | (y rowAt: i) - row ])) transpose.
		dY add: (tmp hadamardProduct: yiDiff) sum
		 ].
	dY := PMMatrix rows: dY.
	
	(iteration % computeErrorEvery = 0) ifTrue: [
		error := PMMatrix rows: (x dimension x) columns: (x dimension x).
		1 to: (x dimension x) do: [ :i |
			1 to: (x dimension x) do: [ :j |
				error rowAt: i columnAt: j put: (
					(p rowAt: i columnAt: j) * (((p rowAt: i columnAt: j) / (q rowAt: i columnAt: j)) ln)
				).
				].
			].
		error := error sum sum.
		job title: ('' join: { 'Step 3/3: Performing gradient descent '. iteration. '/'. maxIter.' error = '. error }).
		job progress: (iteration/maxIter).
		].

	^ dY
]

{ #category : #running }
PMTSNE >> computeLowDimensionalAffinities [
	"Computes affinity of the reduced dimension/output"

	| num sumNum q |
	num := self computeLowDimensionalStudentT.
	sumNum := num sum sum max: (Float epsilon).
	q := num collect: [:element |
				(element / sumNum) max: (Float epsilon)
			].
	^ q
]

{ #category : #running }
PMTSNE >> computeLowDimensionalStudentT [
	"Computes Student's T distribution with 1-degree of freedom for y"

	| num tmp |
	sumY :=  (y hadamardProduct: y) sum.
	tmp := ((y* (y transpose)) * (-2)).
	tmp := PMMatrix rows: (tmp rowsCollect: [ :each| each + sumY]).
	tmp := PMMatrix rows: ((tmp transpose) rowsCollect: [:each| each + sumY]).
	num := (1 + tmp) collect: [ :ele | 1.0 / ele ].
	num := num setDiagonal: (PMVector zeros: (x dimension x)).
	^ num
]

{ #category : #accessing }
PMTSNE >> computePValues [
	"Computes joint probablity matrix P"
	| p sumP |
	p := self computePairwiseAffinities.
	p := p + p transpose.
	sumP := p sum sum.
	p := p collect: [ :element |
		"4 is for early exaggeration, will be removed after 100 iterations"
		(element / sumP * 4) asFloat max: (Float epsilon).
		 ].
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
	
	job title: 'Step 2/3: Computing joint probablity for point 1 of ', n asString.
	job progress: 0.0.
	
	1 to: n do: [ :i |
		"Job progress gets updated every 10 rows"
		(i % 10 = 0) ifTrue: [
			job title: ('' join: {'Step 2/3: Computing joint probablity for point '. i asString. ' of '. n asString}).
			job progress: (i/n).
		 ].
		
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

{ #category : #running }
PMTSNE >> computePairwiseDistances [
	| sumX d tmp|
	sumX := (x hadamardProduct: x) sum.
	tmp := (x * (x transpose)) * (-2).
	tmp := PMMatrix rows: (tmp rowsCollect: [ :each| each + sumX ]).
	d := PMMatrix rows: ((tmp transpose) rowsCollect: [:each| each + sumX]).
	^ d
]

{ #category : #accessing }
PMTSNE >> finalMomentum [
	^ finalMomentum
]

{ #category : #accessing }
PMTSNE >> finalMomentum: aFloat [
	finalMomentum := aFloat
]

{ #category : #accessing }
PMTSNE >> finalMomentumDefaultValue [
	^ 0.8
]

{ #category : #running }
PMTSNE >> gradientDescent [
	"Tries to minimize the cost, which is KL divergence"

	| p gains iY momentum dY yMeanAccumulator |
	job title: 'Step 3/3: Performing gradient descent'.
	p := self computePValues.
	gains := PMMatrix onesRows: x dimension x cols: outputDims.
	iY := PMMatrix zerosRows: x dimension x cols: outputDims.
	momentum := initialMomentum.
	1 to: maxIter do: [ :iteration | 
		dY := self computeGradient: p withProgressUpdate: iteration.
		momentum := iteration < 20
			ifTrue: [ initialMomentum ]
			ifFalse: [ finalMomentum ].
		1 to: (x dimension x) do: [ :i |
			1 to: outputDims do: [ :j |
				((dY rowAt: i columnAt: j) > 0) = ((iY rowAt: i columnAt: j) > 0)
					ifTrue: [ gains rowAt: i columnAt: j put: (((gains rowAt: i columnAt: j) * 0.8) max: minGain) ]
					ifFalse: [ gains rowAt: i columnAt: j put: (gains rowAt: i columnAt: j) + 0.2 ].
				]
			].
		iY := iY * momentum - ((dY hadamardProduct: gains) * learningRate).
		y := y + iY.
		yMeanAccumulator := PMVectorAccumulator new: outputDims.
		y rowsDo: [ :row |
			yMeanAccumulator accumulate: row.
			].
		y := PMMatrix rows: (y rowsCollect: [ :row |
			row - (yMeanAccumulator average)
			]).
		"Stop exaggeration"
		(iteration = 100) ifTrue: [ p := p * (1/4) ].
		].
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

{ #category : #accessing }
PMTSNE >> initialMomentum [
	^ initialMomentum
]

{ #category : #accessing }
PMTSNE >> initialMomentum: aFloat [
	initialMomentum := aFloat
]

{ #category : #accessing }
PMTSNE >> initialMomentumDefaultValue [
	^ 0.5
]

{ #category : #initialization }
PMTSNE >> initialize [
	"These parameters rarely need to be modified"
	maxIter := self maxIterDefaultValue.
	initialMomentum := self initialMomentumDefaultValue.
	finalMomentum := self finalMomentumDefaultValue.
	learningRate := self learningRateDefaultValue.
	minGain := self minGainDefaultValue.
	computeErrorEvery := self computeErrorEveryDefaultValue.
	self initializeJob.
	
]

{ #category : #initialization }
PMTSNE >> initializeJob [
	"This job represents all the steps in t-SNE"
	job := [ 
		self initializeUninitializedParameters.
		self reduceXToInputDims.
		self initializeYWithRandomValues.
		self gradientDescent.
	 ] asJob.
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
PMTSNE >> learningRate [
	^ learningRate 
]

{ #category : #accessing }
PMTSNE >> learningRate: aNumber [
	learningRate := aNumber
]

{ #category : #accessing }
PMTSNE >> learningRateDefaultValue [
	^ 500
]

{ #category : #accessing }
PMTSNE >> maxIter [
	^ maxIter
]

{ #category : #accessing }
PMTSNE >> maxIter: aNumber [
	maxIter := aNumber
]

{ #category : #accessing }
PMTSNE >> maxIterDefaultValue [
	^ 1000
]

{ #category : #accessing }
PMTSNE >> minGain [
	^ minGain
]

{ #category : #accessing }
PMTSNE >> minGain: aFloat [
	minGain := aFloat
]

{ #category : #accessing }
PMTSNE >> minGainDefaultValue [
	^ 0.01
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

{ #category : #accessing }
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
	job title: 'Step 1/3: Reducing input dimensions.'.
	scaler := PMStandardizationScaler new.
	initialDims ifNil: [ initialDims := self initialDimsDefaultValue ].
	pca := aClass new componentsNumber: (initialDims min: x dimension y).
	x := pca fitAndTransform: (scaler fitAndTransform: x)
]

{ #category : #running }
PMTSNE >> start [
	job run.
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

{ #category : #accessing }
PMTSNE >> y: aNumber [
	y:= aNumber
]
