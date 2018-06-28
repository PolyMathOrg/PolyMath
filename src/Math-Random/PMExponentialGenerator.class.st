"
An ExponentialGenerator uses a uniform random variable in [0,1] to sample from an exponential distribution.

The exponential distribution has a single parameter beta, here denoted as mean. 

The default RandomGenerator is PMRandom, but can be modified.

The next method uses the formula:

x=  - \beta * ln (1 - u)

to generate an exponential sample x from a uniform [0,1] sample u.

(Applied Statistics 3rd ed., Ledolter and Hogg, p. 185)
"
Class {
	#name : #PMExponentialGenerator,
	#superclass : #PMNumberGenerator,
	#instVars : [
		'mean'
	],
	#category : 'Math-Random'
}

{ #category : #'instance creation' }
PMExponentialGenerator class >> mean: aNumber [
	^ self basicNew 
		generator: self defaultGeneratorClass new;
		mean: aNumber;
		yourself
]

{ #category : #'instance creation' }
PMExponentialGenerator class >> new [
	^ self mean: 1
]

{ #category : #accessing }
PMExponentialGenerator >> mean [
	^ mean
]

{ #category : #accessing }
PMExponentialGenerator >> mean: aNumber [
	mean := aNumber
]

{ #category : #'stream access' }
PMExponentialGenerator >> next [
	^ mean negated * ((1 - randomNumberGenerator next) ln)
]

{ #category : #'stream access' }
PMExponentialGenerator >> peek [
	^ mean negated * ((1 - randomNumberGenerator peek) ln)
]
