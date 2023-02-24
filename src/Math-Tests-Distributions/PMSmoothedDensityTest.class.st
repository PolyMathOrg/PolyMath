Class {
	#name : #PMSmoothedDensityTest,
	#superclass : #TestCase,
	#instVars : [
		'density'
	],
	#category : #'Math-Tests-Distributions-KernelSmoothing'
}

{ #category : #running }
PMSmoothedDensityTest >> setUp [ 
density:=PMKernelSmoothedDensity fromData: #(1 2 3 1 2.3 2.4).
]

{ #category : #tests }
PMSmoothedDensityTest >> testAverage [

	self assert: (density data average closeTo: density average)
]

{ #category : #tests }
PMSmoothedDensityTest >> testBandWidth [

	density bandWidth: 2.
	self assert: density bandWidth equals: 2.
	density ruleOfThumbBandWidth.
	self assert: (density bandWidth closeTo: 0.505899674).
	density data: #( 1 2 3 1 2.3 2.4 7 ).
	density ruleOfThumbBandWidth.
	self assert: (density bandWidth closeTo: 0.728178892).
	density data: #( 1 2 3 1 2.3 2.4 7 -7 ).
	density epanechnikov.
	self assert: (density bandWidth closeTo: 0.728178892).
	density ruleOfThumbBandWidth.
	self assert: (density bandWidth closeTo: 0.753301158)
]

{ #category : #tests }
PMSmoothedDensityTest >> testDistributionValue [

	self assert: (density distributionValue: 500) equals: 1.
	self assert: (density distributionValue: -500) equals: 0.
	self assert: ((density distributionValue: 2) closeTo: 0.494519759).
	self assert: ((density distributionValue: 3) closeTo: 0.8791407588).
	density epanechnikov.
	self assert: (density distributionValue: 5) equals: 1.
	self assert: (density distributionValue: -1) equals: 0.
	self assert: ((density distributionValue: 2) closeTo: 0.506985855)
]

{ #category : #tests }
PMSmoothedDensityTest >> testEpanechnikov [

	| f |
	f := 5 sqrt.
	density epanechnikov.
	self assert: (density kernel value: f) equals: 0.
	self assert: (density kernel value: f negated) equals: 0.
	self assert: (density kernel value: 0) equals: 3 / (4 * f).
	f := 3 / (5 * f).
	self assert: ((density kernel value: 1) closeTo: f).
	self assert: ((density kernel value: -1) closeTo: f).
	f := ReadWriteStream with: ''.
	density printOn: f.
	self assert: (f contents findString: 'epanechnikov') > 0
]

{ #category : #tests }
PMSmoothedDensityTest >> testIKernel [

	density iKernel: [ :x | x ].
	self assert: ((density distributionValue: 1) closeTo: -1.87784268)
]

{ #category : #tests }
PMSmoothedDensityTest >> testKernelAndData [
	| b |
	b := [ :x | x ].
	density kernel: b.
	density data: #(-1 2 2 5).
	self assert: density data equals: #(-1 2 2 5) asSortedCollection.
	self assert: density kernel equals: b.
	self assert: (density value: 2) equals: 0
]

{ #category : #tests }
PMSmoothedDensityTest >> testNormal [

	| r |
	density normal.
	r := 0.2419707245.
	self assert:
		((#( 1 0 -1 -2.9 ) collect: [ :x | density kernel value: x ]) 
			 closeTo: (Array
					  with: r
					  with: 0.3989422804
					  with: r
					  with: 0.0059525324197))
]

{ #category : #tests }
PMSmoothedDensityTest >> testPrint [
|aStream  s|
aStream :=ReadWriteStream with:''.
PMKernelSmoothedDensity new printOn: aStream .
self assert: ((aStream contents findString: 'nil')>1).
aStream reset.
density printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'normal')>0).
self assert: ((s findString: '6')>0).
self assert: ((s findString: '0.50589967')>0).

]

{ #category : #tests }
PMSmoothedDensityTest >> testValue [

	self assert: ((density value: 0.5) closeTo: 0.1632610644).
	self assert:
		((density value: #( 0.5 1 )) closeTo: #( 0.1632610644 0.28923996 )).
	density epanechnikov.
	self assert: (density value: -0.4) equals: 0.
	self assert: ((density value: 0.5) closeTo: 0.177824205).
	self assert: (density value: 5) equals: 0
]

{ #category : #tests }
PMSmoothedDensityTest >> testVariance [

	| v |
	v := density variance.
	self assert: (density standardDeviation closeTo: v sqrt).
	self assert: density data stdev < v sqrt.
	self assert: (v closeTo: 0.902934480)
]
