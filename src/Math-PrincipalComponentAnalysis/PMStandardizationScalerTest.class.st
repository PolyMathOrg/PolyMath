Class {
	#name : #PMStandardizationScalerTest,
	#superclass : #TestCase,
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #tests }
PMStandardizationScalerTest >> testMean [
	| anArray t |
	anArray := PMMatrix rows: #(#(1.0 -1.0 2.0) #(2.0 0.0 0.0) #(0.0 1.0 -1.0)).
	t := PMStandardizationScaler new.
	t fit: anArray.
	self assert: t mean asArray closeTo: #(1.0 0.0 0.3333333)
]

{ #category : #tests }
PMStandardizationScalerTest >> testScale [
	| anArray t |
	anArray := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: anArray.
	self assert: t scale asArray closeTo: #(0.5 0.5)
]

{ #category : #tests }
PMStandardizationScalerTest >> testVariance [
	| anArray t |
	anArray := PMMatrix rows: #((0.0 0.0) #(0.0 0.0) #(1.0 1.0) #(1.0 1.0)).
	t := PMStandardizationScaler new.
	t fit: anArray.
	self assert: t variance asArray closeTo: #(0.25 0.25)
]
