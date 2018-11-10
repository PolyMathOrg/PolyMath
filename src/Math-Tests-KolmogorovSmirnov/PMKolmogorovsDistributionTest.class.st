"
data are taken from: http://www.ism.ac.jp/editsec/aism/pdf/054_3_0577.pdf  
"
Class {
	#name : #PMKolmogorovsDistributionTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-KolmogorovSmirnov'
}

{ #category : #tests }
PMKolmogorovsDistributionTest >> testBig [
	| kd |
	kd := PMKolmogorovsDistribution exampleSize: 1000.
	self assert: (kd average round: 4) equals: (0.02730 round: 4).
	self
		assert: (kd standardDeviation round: 5) - (0.008229 round: 5) < 2.01e-5.
	self assert: (kd skewness round: 2) equals: (0.8616 round: 2).
	self assert: (kd kurtosis round: 2) equals: (3.884 round: 2).
	kd := PMKolmogorovsDistribution exampleSize: 500.
	self assert: ((kd distributionValue: 0.0229) round: 2) equals: 0.05.
	self assert: ((kd distributionValue: 0.0605) round: 3) equals: 0.95
]

{ #category : #tests }
PMKolmogorovsDistributionTest >> testMedium [
	| kd |
	kd := PMKolmogorovsDistribution exampleSize: 100.
	self assert: (kd average round: 3) equals: (0.08519 round: 3).
	self
		assert: (kd standardDeviation round: 3)
		equals: (0.025916 round: 3).
	self assert: (kd skewness round: 2) equals: (0.8561 round: 2).
	self
		assert: ((kd kurtosis round: 2) - (3.869 round: 2)) abs <= 0.0101.	"this result is slightly off"
	self assert: ((kd distributionValue: 0.0503) round: 3) equals: 0.05.
	self assert: ((kd distributionValue: 0.1339) round: 3) equals: 0.95.
	self assert: kd parameters equals: #(100)
]

{ #category : #tests }
PMKolmogorovsDistributionTest >> testSmall [
	| kd |
	kd := PMKolmogorovsDistribution exampleSize: 10.
	self assert: (kd average round: 2) equals: (0.25916 round: 2).
	self
		assert: (kd standardDeviation round: 3)
		equals: (0.079832 round: 3).
	self assert: (kd skewness round: 2) equals: (0.8180 round: 2).
	self assert: (kd kurtosis round: 2) equals: (3.697 round: 2).
	self assert: ((kd distributionValue: 0.1512) round: 3) equals: 0.05.
	self assert: ((kd distributionValue: 0.4103) round: 3) equals: 0.95.
	self assert: kd parameters equals: #(10)
]
