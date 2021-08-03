Class {
	#name : #PMStatisticsTests,
	#superclass : #TestCase,
	#category : #'Math-Tests-Statistics'
}

{ #category : #tests }
PMStatisticsTests >> testGeometricMean [
	self
		assert:
			((PMStatisticalSample new data: #(1 1 2 3 4 5 5 6 6 7 8 9))
				geometricMean round: 4)
		equals: 3.8584.
	self
		assert:
			((PMStatisticalSample new
				data:
					{4.
					1.
					(1 / 32)}) geometricMean round: 4)
		equals: 0.5.
	self
		assert:
			((PMStatisticalSample new data: #(3.14 1 4.56 0.333)) geometricMean
				round: 4)
		equals: 1.4777.
	self
		should: [ (PMStatisticalSample new data: #(-1 5 6.78)) geometricMean ]
		raise: Error.
	self
		assert:
			((PMStatisticalSample geometricMean: 
					{4.
					1.
					(1 / 32)}) round: 4)
		equals: 0.5.
]

{ #category : #tests }
PMStatisticsTests >> testHarmonicMean [
	self
		assert: ((PMStatisticalSample new data: #(2.5 3 10)) harmonicMean round: 1)
		equals: 3.6.
	self
		assert: ((PMStatisticalSample harmonicMean: #(2.5 3 10)) round: 1)
		equals: 3.6.
	self
		should: [ (PMStatisticalSample new data: #(3 1.1 -1)) harmonicMean ]
		raise: Error
]

{ #category : #tests }
PMStatisticsTests >> testMode [
	| c |
	c := PMStatisticalSample new data: #(1 2 3 4 5 5).
	self assert: c mode equals: 5.
	c := PMStatisticalSample mode: #(1 2 3 4 5 5).
	self assert: c equals: 5.
	c := PMStatisticalSample new data: #(5 6 8 3 3 3 2 2 2).
	self assert: c mode equals: 2.
	c := PMStatisticalSample new data: #(1.1 1.2 1.1 3.4).
	self assert: c mode equals: 1.1.
	c := PMStatisticalSample new
		data: #(dat1 dat2 dat4 dat1 dat4 dat4 dat2 dat9 dat8).
	self assert: c mode equals: 'dat4'
]
