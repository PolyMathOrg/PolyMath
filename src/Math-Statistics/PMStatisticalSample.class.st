"
I am a collection of data that statistical measures can be applied to. 
 
My input collection can be anything but most measures need numerical data to work properly.

Create me by calling new and then calling my `data:` message

    sample := PMStatisticalSample new
	 sample data: #(1 2 3 4 5)

or using my `newFrom:` class message 

	sample := PMStatisticalSample newFrom: #(1 2 3 4 5)

Now you can get statistical measures of the data using any of the following messages 

    sample mode
	 sample geometricMean
	 sample harmonicMean

If you only want one statistical measure for a collection you can use my class methods

	 gMean := PMStatisticalSample geometricMean: #(1 2 3 4 5)
    hMean := PMStatisticalSample harmonicMean: #(1 2 3 4 5)
    mode := PMStatisticalSample mode: #(1 2 3 4 5)


"
Class {
	#name : #PMStatisticalSample,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Math-Statistics'
}

{ #category : #information }
PMStatisticalSample class >> geometricMean: aSample [
	"Calculate the geometric mean of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) geometricMean
]

{ #category : #information }
PMStatisticalSample class >> harmonicMean: aSample [
	"Calculate the harmonic mean of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) harmonicMean
]

{ #category : #information }
PMStatisticalSample class >> mean: aSample [
	"Calculate the mean of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) mean
]

{ #category : #information }
PMStatisticalSample class >> median: aSample [
	"Calculate the median of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) median
]

{ #category : #information }
PMStatisticalSample class >> mode: aSample [
	"Calculate the mode of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) mode
]

{ #category : #'instance creation' }
PMStatisticalSample class >> newFrom: aSample [
	"Create a new PMStatisticalSample with aCollection as the data"

	| ss |
	ss := self new.
	ss data: aSample.
	^ ss
]

{ #category : #information }
PMStatisticalSample class >> stdev: aSample [
	"Calculate the standard deviation of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) stdev
]

{ #category : #information }
PMStatisticalSample class >> variance: aSample [
	"Calculate the variance of a collection. This shortcut method will create a new instance of PMStatisticalSample and return the desired metric."

	^ (self newFrom: aSample) variance
]

{ #category : #information }
PMStatisticalSample >> average [
	"An alias for the arithmetic mean of the sample"
	^ data average
]

{ #category : #accessing }
PMStatisticalSample >> data [
	"Get the collection that this StatisticalSample is calculated against"

	^data 
]

{ #category : #accessing }
PMStatisticalSample >> data: aSample [
	"Set the collection of data points that statistical samples will be made against"

	data := aSample
]

{ #category : #information }
PMStatisticalSample >> geometricMean [
	"Answer with the geometric mean of the collection"

	"(PMStatisticalSample new data: #(1 1 2 3 4 5 5 6 6 7 8 9)) geometricMean  >>> 3.8583980015011217"

	"(PMStatisticalSample new data: { 4. 1.  1 / 32}) geometricMean >>> 0.49999999999999994"

	"(PMStatisticalSample new data: #(3.14 1 4.56 0.333)) geometricMean >>> 1.4776945822943937"

	"(PMStatisticalSample new data: {1/3. 2/3. 8/3. 16/3}) geometricMean >>> 1.3333333333333335"

	data
		detect: [ :i | i <= 0 ]
		ifFound: [ Error new
				signal: 'The geometric mean should only be calculated on positive numbers' ].

	"For large collections there is a chance of Float overflow/underflow when raising to a fraction. 
	 Instead sum the logarithms with the side effect that the returned value will be a Float and subject 
	 to floating point arethmetic imprecision"
	"^(self reduce: [ :a :b | a * b ] ) raisedToFraction:  1 / self size."
	^ ((data collect: #ln) sum / data size) exp
]

{ #category : #information }
PMStatisticalSample >> harmonicMean [
	"Answer with the harmonic mean of the data."

	"(PMStatisticalSample new data: #(2.5 3 10)) harmonicMean >>> 3.6"

	| sum |
	data
		detect: [ :i | i <= 0 ]
		ifFound: [ Error new
				signal: 'The harmonic mean should only be calculated on positive numbers' ].
	sum := 0.
	data do: [ :i | sum := sum + (1 / i) ].
	^ data size / sum
]

{ #category : #information }
PMStatisticalSample >> mean [
	"answers with the arithmetic mean of the sample."

	"(PMStatisticalSample new data: #(1 2 2 2 3 4 5)) mean  >>> (19/7)"

	"(PMStatisticalSample new data: #(5 5 1 1 2 3 4)) mean  >>> 3"

	^ self average
]

{ #category : #information }
PMStatisticalSample >> median [
	"The middle value of a statistical sample."
	^ data median
]

{ #category : #information }
PMStatisticalSample >> mode [
	"answers with the most common value in a collection.
	
	If there are values that are equally common then the one that is 
	smallest is returned."

	"(PMStatisticalSample new data: #(1 2 2 2 3 4 5)) mode  >>> 2"

	"(PMStatisticalSample new data: #(5 5 1 1 2 3 4)) mode  >>> 1"

	^ (data asBag sortedCounts at: 1) value
]

{ #category : #information }
PMStatisticalSample >> stdev [
	"Answers with the standard deviation of the statistical sample"
	^ data stdev
]

{ #category : #information }
PMStatisticalSample >> variance [
	"Answers with the variance of the statistical sample."
	^ self stdev squared
]
