"
Implementation of t-SNE (t-Distributed Stochastic Neighbor Embedding) algorithm

https://lvdmaaten.github.io/tsne/

t-SNE is a technique for dimensionality reduction that is particularly well suited for the visualization of high-dimensional datasets. 
"
Class {
	#name : #TSNE,
	#superclass : #Object,
	#instVars : [
		'ndims',
		'initialdims',
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
	#category : 'Math-TSNE'
}

{ #category : #examples }
TSNE class >> example1 [
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
TSNE class >> gridDataGeneratorOf: size [
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
TSNE >> computePValues [
"
#Compute P-values
	P = x2p(X, 1e-5, perplexity);
	P = P + Math.transpose(P);
	P = P / Math.sum(P);
	P = P * 4;									# early exaggeration
	P = Math.maximum(P, 1e-12);
"
| p n |
p := self x2p.
p := p + p transpose.
p := p / (p sum).
p := p *4.
p := p max: 1e-12.
^ p
]

{ #category : #'as yet unclassified' }
TSNE >> computePairwiseAffinities [
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

{ #category : #'as yet unclassified' }
TSNE >> computePairwiseDistances [
	| sumX d tmp|
	sumX := (x dot: x) sum.
	tmp := (x * (x transpose)) * (-2).
	tmp := PMMatrix rows: (tmp rowsCollect: [ :each| each + sumX ]).
	d := PMMatrix rows: ((tmp transpose) rowsCollect: [:each| each + sumX]).
	^ d
]

{ #category : #running }
TSNE >> epsilon: aFloat [
	epsilon := aFloat
]

{ #category : #'as yet unclassified' }
TSNE >> initialDims [
	^initialdims 
]

{ #category : #'as yet unclassified' }
TSNE >> initialDims: aFloat [
	initialdims := aFloat
]

{ #category : #'as yet unclassified' }
TSNE >> initialDimsDefaultValue [
	^ 50
]

{ #category : #initialization }
TSNE >> initialize [
	maxIter := 1000.
	initialMomentum := 0.5.
	finalMomentum := 0.8.
	eta := 500.
	minGain := 0.01.
	
]

{ #category : #initialization }
TSNE >> initializeUninitializedParameters [
	perplexity ifNil: [ perplexity := self perplexityDefaultValue ].
	ndims ifNil: [ ndims := self ndimsDefaultValue ].
	initialdims ifNil: [ initialdims := self initialDimsDefaultValue ]
]

{ #category : #initialization }
TSNE >> initializeYWithRandomValues [
	"Answer a new Matrix Y with the number of rows of x and number of columns ndims filled with random numbers following a normal distribution (0,1)"
	"We should add this to PMMatrix API later"

	| a b rows columns d |
	rows := x dimension x.
	columns := ndims.
	d := PMNormalDistribution new:0 sigma: 1.
	a := (1 to: rows)
		collect: [ :row | 
			b := PMVector new: columns.
			1 to: columns do: [ :column | b at: column put: d random ].
			b ].
	y := PMMatrix rows: a
]

{ #category : #accessing }
TSNE >> ndims [
	^ ndims
]

{ #category : #'as yet unclassified' }
TSNE >> ndimsDefaultValue [
	^ 2
]

{ #category : #accessing }
TSNE >> perplexity [
	^ perplexity
]

{ #category : #accessing }
TSNE >> perplexity: aFloat [
	perplexity := aFloat
]

{ #category : #'as yet unclassified' }
TSNE >> perplexityDefaultValue [
	^ 30.0
]

{ #category : #running }
TSNE >> runPcaOnX [
	"Runs PCA on X in order to reduce its dimensionality to initialdims dimensions.

	print ""Preprocessing the data using PCA...""
	(n, d) = X.shape;
	X = X - Math.tile(Math.mean(X, 0), (n, 1));
	(l, M) = Math.linalg.eig(Math.dot(X.T, X));
	Y = Math.dot(X, M[:,0:no_dims]);
	return Y;
"

	"| analyzer i |
	analyzer := PMPrincipalComponentAnalyser new: initialdims.
	i := 1.
	x dimension x
		timesRepeat: [ analyzer accumulate: (x rowAt: i).
			i := i + 1 ].
	^ analyzer components"
]

{ #category : #accessing }
TSNE >> start [
	self initializeUninitializedParameters.
	self runPcaOnX.
	self initializeYWithRandomValues.
	self x2p
]

{ #category : #'stepping and presenter' }
TSNE >> step [
	self computePairwiseAffinities
]

{ #category : #'as yet unclassified' }
TSNE >> x2p [
	| p d beta logU n betaMin betaMax|
	n := x numberOfRows.
	d := self computePairwiseDistances.
	p := PMMatrix zerosRows: n cols: n.
	beta := PMMatrix onesRows: n cols: 1.
	logU := self perplexity log.
	n timesRepeat: [
		betaMin := Float infinity.
		betaMax := Float infinity negated.
		
		 ]
]

{ #category : #accessing }
TSNE >> x: aPMMatrix [
	x := aPMMatrix
]

{ #category : #accessing }
TSNE >> y [
	^ y
]
