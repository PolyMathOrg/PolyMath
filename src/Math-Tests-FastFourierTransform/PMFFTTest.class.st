Class {
	#name : #PMFFTTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-FastFourierTransform'
}

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
PMFFTTest >> testFFT [
	| data data1 f s |
	data := (1 to: 256)
		collect: [ :i | (Float pi * (i - 1) / (256 / 8)) cos ].
	data := #(-2 -2 -2 3 3 3 1 -2).
	f := PMFastFourierTransform data: data.
	f chop: 1.01.
	self assert: f realData equals: #(-2 -2 -2 3 3 3 0 -2).
	f chop: 2.01.
	self assert: f realData equals: #(0 0 0 3 3 3 0 0).
	f data: data.
	f transform.
	f inverseTransform.
	s := (f imaginaryData select: [ :i | i equalsTo: 0 ]) size.
	self assert: s equals: 8.
	s := (f realData - data select: [ :i | i equalsTo: 0 ]) size.
	self assert: s equals: 8
]

{ #category : #tests }
PMFFTTest >> testFastFourierTransformCalculatesTheDiscreteFourierTransformWithoutLossOfSignal [

	| cosineWaveSignal f zeroedImaginaryData zeroedRealData inputOutputDiff |
	cosineWaveSignal := (1 to: 256) collect: [ :i | 
		                    (Float pi * (i - 1) / (256 / 8)) cos ].
	f := PMFastFourierTransform data: cosineWaveSignal.

	f transform.
	f inverseTransform.

	zeroedImaginaryData := (f imaginaryData select: [ :i | i equalsTo: 0 ])
		                       size.
	inputOutputDiff := f realData - cosineWaveSignal.
	zeroedRealData := (inputOutputDiff select: [ :i | i equalsTo: 0 ])
		                  size.
	self assert: zeroedImaginaryData equals: 256.
	self assert: zeroedRealData equals: 256.

	PMMitchellMooreGenerator reset: 1
]

{ #category : #tests }
PMFFTTest >> testFastFourierTransformOutputSignalMatchesInputSignalClosely [
	| data data1 f s |
	data := (1 to: 256)
		collect: [ :i | (Float pi * (i - 1) / (256 / 8)) cos ].
	data1 := data collect: [ :i | i + 0.001 random - 0.0005 ].
	f := PMFastFourierTransform data: data1.
	f transform.
	f chop: 0.01.
	f inverseTransform.
	self assert: (f realData - data) abs max < 4e-5.
]
