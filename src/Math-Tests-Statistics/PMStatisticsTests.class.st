Class {
	#name : #PMStatisticsTests,
	#superclass : #TestCase,
	#category : #'Math-Tests-Statistics'
}

{ #category : #tests }
PMStatisticsTests >> testGeometricMean [
	self assert: (#(1 1 2 3 4 5 5 6 6 7 8 9) geometricMean round: 4) equals: 3.8584.
	
	self assert: ({ 4. 1.  1 / 32} geometricMean round: 4) equals: 0.5.
	
	self assert: (#(3.14 1 4.56 0.333) geometricMean round: 4 ) equals: 1.4777.
	
	self should: [ #(-1 5 6.78) geometricMean ] raise: Error.
]

{ #category : #tests }
PMStatisticsTests >> testHarmonicMean [
	self assert: (#(2.5 3 10) harmonicMean round: 1) equals: 3.6.
	
	self should: [ #(3 1.1 -1 ) harmonicMean ] raise: Error. 
]

{ #category : #tests }
PMStatisticsTests >> testMode [
	| c |
	c := #(1 2 3 4 5 5).
	self assert: c mode equals: 5.
	
	c := #(5 6 8 3 3 3 2 2 2).
	self assert: c mode equals: 2.
	
	c := #(1.1 1.2 1.1 3.4).
	self assert: c mode equals: 1.1.
	
	c := #(dat1 dat2 dat4 dat1 dat4 dat4 dat2 dat9 dat8).
	self assert: c mode equals: 'dat4'.
]
