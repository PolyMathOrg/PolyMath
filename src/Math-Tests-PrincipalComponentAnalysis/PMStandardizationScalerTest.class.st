Class {
	#name : 'PMStandardizationScalerTest',
	#superclass : 'TestCase',
	#category : 'Math-Tests-PrincipalComponentAnalysis',
	#package : 'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : 'tests' }
PMStandardizationScalerTest >> testMean [
	| aMatrix t |
	aMatrix := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t mean  closeTo: #(0.5 0.5)
]

{ #category : 'tests' }
PMStandardizationScalerTest >> testScale [
	| aMatrix t |
	aMatrix := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t scale asPMVector closeTo: #(0.5 0.5)
]

{ #category : 'tests' }
PMStandardizationScalerTest >> testTransform [
	| aMatrix t |
	aMatrix := PMMatrix rows: #(#(0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	self assert: (t fitAndTransform: aMatrix) equals: (PMMatrix rows: #(#(-1.0 -1.0) #(-1.0 -1.0) #(1.0 1.0) #(1.0 1.0)))
]

{ #category : 'tests' }
PMStandardizationScalerTest >> testTransformAnotherMatrix [
	| aMatrix t anotherMatrix |
	aMatrix := PMMatrix rows: #(#(0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	anotherMatrix := PMMatrix rows: #(#(2 2)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: (t transform: anotherMatrix) equals: (PMMatrix rows: #(#(3 3)))
]

{ #category : 'tests' }
PMStandardizationScalerTest >> testTransformConstantFeature [
	| aMatrix t |
	aMatrix := PMMatrix rows: #(#(8.0 0.0) #(8.0 0.0) #(8.0 1.0) #(8.0 1.0)).
	t := PMStandardizationScaler new.
	self assert: (t fitAndTransform: aMatrix) equals: (PMMatrix rows: #(#(0.0 -1.0) #(0.0 -1.0) #(0.0 1.0) #(0.0 1.0)))
]

{ #category : 'tests' }
PMStandardizationScalerTest >> testVariance [
	| aMatrix t |
	aMatrix := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t variance  asPMVector closeTo: #(0.25 0.25)
]

{ #category : 'tests' }
PMStandardizationScalerTest >> testZeroScale [
	"Tests if PMStandardizationScaler handles case when scale is 0, by changing it to 1.
	 Happens when one feature is constant eg: 8.0 in this test."

	| aMatrix t |
	aMatrix := PMMatrix rows: #((8.0 0.0) #(8.0 0.0) #(8.0 1.0) #(8.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: aMatrix.
	self assert: t scale asPMVector  closeTo: #(1.0 0.5)
]
