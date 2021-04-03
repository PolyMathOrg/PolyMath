Class {
	#name : #PMMultivariateNormalDistribution,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'meanVector',
		'covarianceMatrix'
	],
	#category : #'Math-Core-Distribution'
}

{ #category : #'instance creation' }
PMMultivariateNormalDistribution class >> meanVector: aMeanVector covarianceMatrix: aCovarianceMatrix [
	^ self new
		initializeMeanVector: aMeanVector
		covarianceMatrix: aCovarianceMatrix;
		yourself
]

{ #category : #information }
PMMultivariateNormalDistribution >> average [
	^ self meanVector
]

{ #category : #transformation }
PMMultivariateNormalDistribution >> changeParametersBy: aVector [
	"Modify the parameters of the receiver by aVector."
	meanVector := meanVector + aVector first.
	covarianceMatrix := covarianceMatrix + aVector second.
]

{ #category : #information }
PMMultivariateNormalDistribution >> covarianceMatrix [
	^ covarianceMatrix 
]

{ #category : #information }
PMMultivariateNormalDistribution >> distributionValue: aNumber [
	"Answers the probability of observing a random variable distributed according to the receiver with a value lower than or equal to aNumber. Also known as the cumulative density function (CDF)."
	
	self shouldBeImplemented 
]

{ #category : #initialization }
PMMultivariateNormalDistribution >> initializeMeanVector: aMeanVector covarianceMatrix: aCovarianceMatrix [
	meanVector := aMeanVector.
	covarianceMatrix := aCovarianceMatrix.
]

{ #category : #information }
PMMultivariateNormalDistribution >> kurtosis [
	"Kurtosis is a measure of the 'tailedness' of the probability distribution of a real-valued random variable. Not defined for a multivariate normal distribution"
	self shouldNotImplement
]

{ #category : #information }
PMMultivariateNormalDistribution >> meanVector [
	^ meanVector 
]

{ #category : #information }
PMMultivariateNormalDistribution >> parameters [
	"Returns an Array containing the parameters of the distribution. 
	It is used to print out the distribution and for fitting."

	^ { meanVector . covarianceMatrix }
]

{ #category : #information }
PMMultivariateNormalDistribution >> power [
	"Number of dimensions of a multivariate normal distribution"
	^ meanVector size
]

{ #category : #information }
PMMultivariateNormalDistribution >> random [ 
	"Answer a vector of random numbers distributed accroding to the receiver."
	| standardNormalRandom upperTriangular |
	
	standardNormalRandom := (1 to: self power) asPMVector
		collect: [ :each | PMNormalDistribution random ].
		
	upperTriangular := covarianceMatrix choleskyDecomposition.
	
	^ upperTriangular transpose * standardNormalRandom + meanVector
]

{ #category : #information }
PMMultivariateNormalDistribution >> skewness [
	"Skewness is a measure of the asymmetry of the probability distribution of a real-valued random variable about its mean. Not defined for a multivariate normal distribution"
	self shouldNotImplement
]

{ #category : #information }
PMMultivariateNormalDistribution >> value: aVector [
	"Answers the probability that a random variable distributed according to the receiver gives a value between aVector and aVector + espilon (infinitesimal interval)."
	
	^ (-1/2 * (aVector - meanVector) * covarianceMatrix inverse * (aVector - meanVector)) exp / (((2 * Float pi) raisedTo: self power) * covarianceMatrix determinant) sqrt
]
