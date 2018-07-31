Class {
	#name : #PMStandardizationScalerTest,
	#superclass : #TestCase,
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #tests }
PMStandardizationScalerTest >> testMean [	
	| aMatrix t |
	aMatrix := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t mean asArray closeTo: #(0.5 0.5)
]

{ #category : #tests }
PMStandardizationScalerTest >> testScale [
	| aMatrix t |
	aMatrix := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t scale asArray closeTo: #(0.5 0.5)
]

{ #category : #tests }
PMStandardizationScalerTest >> testTransform [
	| aMatrix t |
	aMatrix := PMMatrix rows: #(#(0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	self assert: (t fitAndTransform: aMatrix) equals: (PMMatrix rows: #(#(-1.0 -1.0) #(-1.0 -1.0) #(1.0 1.0) #(1.0 1.0)))
]

{ #category : #tests }
PMStandardizationScalerTest >> testTransformAnotherMatrix [
	| aMatrix t anotherMatrix |
	aMatrix := PMMatrix rows: #(#(0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	anotherMatrix := PMMatrix rows: #(#(2 2)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: (t transform: anotherMatrix) equals: (PMMatrix rows: #(#(3 3)))
]

{ #category : #tests }
PMStandardizationScalerTest >> testVariance [
	| aMatrix t |
	aMatrix := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t variance asArray closeTo: #(0.25 0.25)
]
