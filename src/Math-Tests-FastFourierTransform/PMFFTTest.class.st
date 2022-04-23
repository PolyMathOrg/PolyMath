Class {
	#name : #PMFFTTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-FastFourierTransform'
}

{ #category : #asserting }
PMFFTTest >> assertNoDataLossInDiscreteFourierTransferOf: inputSequence [

	| zeroedRealData f zeroedImaginaryData inputOutputDiff |
	f := PMFastFourierTransform data: inputSequence.

	f transform.
	f inverseTransform.

	zeroedImaginaryData := f imaginaryData select: [ :i | i equalsTo: 0 ].
	inputOutputDiff := f realData - inputSequence.
	zeroedRealData := inputOutputDiff select: [ :i | i equalsTo: 0 ].
	self assert: zeroedImaginaryData size equals: inputSequence size.
	self assert: zeroedRealData size equals: inputSequence size
]

{ #category : #tests }
PMFFTTest >> generateCosineWaveSignal: sampleSize [

	^ (1 to: sampleSize) collect: [ :i | 
		  (Float pi * (i - 1) / (sampleSize / 8)) cos ]
]

{ #category : #tests }
PMFFTTest >> testBitReverse [
	self should: [ 1 bitReverse: 0 ] raise: Error.
	self should: [ 2 bitReverse: 1 ] raise: Error.
	self assert: (0 bitReverse: 0) equals: 0.
	self assert: (1 bitReverse: 1) equals: 1.
	self assert: (1 bitReverse: 3) equals: 4.
	self assert: (4 bitReverse: 3) equals: 1.
	self assert: (5 bitReverse: 3) equals: 5.
	self assert: (5 bitReverse: 4) equals: 10.
	self
		assert: (5 bitReverse: 17)
		equals: (2 raisedTo: 16) + (2 raisedTo: 14).
	self assert: ((17 bitReverse: 17) bitReverse: 17) equals: 17
]

{ #category : #tests }
PMFFTTest >> testFrequencyDomainRepresentationMatchesRandomizedInputSignalClosely [

	| cosineWaveSignal randomizedCosineWaveSignal f |
	cosineWaveSignal := self generateCosineWaveSignal: 256.
	randomizedCosineWaveSignal := cosineWaveSignal collect: [ :i | i + 0.001 random - 0.0005 ].
	f := PMFastFourierTransform data: randomizedCosineWaveSignal.

	f transform.
	f chop: 0.01.
	f inverseTransform.

	self assert: (f realData - cosineWaveSignal) abs max < 4e-5
]

{ #category : #tests }
PMFFTTest >> testThatChopSuccessivelyRemovesInputSignalPointsLowerThanTolerance [ 
	| inputSignal f |
	inputSignal := #(-2 -2 -2 3 3 3 1 -2).
	f := PMFastFourierTransform data: inputSignal.
	f chop: 1.01.
	self assert: f realData equals: #(-2 -2 -2 3 3 3 0 -2).
	f chop: 2.01.
	self assert: f realData equals: #(0 0 0 3 3 3 0 0).
]

{ #category : #tests }
PMFFTTest >> testThatDiscreteFourierTransformDoesNotLoseDataForLargeDataSets [

	| inputSequence |
	inputSequence := self generateCosineWaveSignal: 256.
	self assertNoDataLossInDiscreteFourierTransferOf: inputSequence
]

{ #category : #tests }
PMFFTTest >> testThatDiscreteFourierTransformDoesNotLoseDataForSmallDataSets [

	| inputSequence |
	inputSequence := #(  -2  -2  -2 3 3 3 1  -2 ).
	self assertNoDataLossInDiscreteFourierTransferOf: inputSequence
]
