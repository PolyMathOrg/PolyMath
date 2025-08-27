Class {
	#name : 'PMMultivariateNormalDistributionTest',
	#superclass : 'TestCase',
	#instVars : [
		'meanVector',
		'covarianceMatrix',
		'distribution'
	],
	#category : 'Math-Tests-Distributions-Normal',
	#package : 'Math-Tests-Distributions',
	#tag : 'Normal'
}

{ #category : 'running' }
PMMultivariateNormalDistributionTest >> setUp [
	super setUp.

	meanVector := #(0 1) asPMVector.

	covarianceMatrix := PMMatrix rows: #(
		(1 0.8)
		(0.8 1)).

	distribution := PMMultivariateNormalDistribution
		meanVector: meanVector
		covarianceMatrix: covarianceMatrix
]

{ #category : 'tests' }
PMMultivariateNormalDistributionTest >> testAverage [
	self assert: distribution average equals: meanVector
]

{ #category : 'tests' }
PMMultivariateNormalDistributionTest >> testPower [
	self assert: distribution power equals: 2
]

{ #category : 'tests' }
PMMultivariateNormalDistributionTest >> testRandom [
	self assert: distribution random size equals: distribution power
]

{ #category : 'tests' }
PMMultivariateNormalDistributionTest >> testValue [
	| interval points expectedPDF |

	interval := -1 to: 1 by: 0.5.

	points := interval flatCollect: [ :i |
		interval collect: [ :j | { i . j } asPMVector ] ].

	"Values calculated using Python's scipy"
	expectedPDF :=  #(0.021773722141141552 0.08146294715905042 0.1521928217104107 0.14198250365871087 0.06614272766298167 0.0066868859054493935 0.043603973467720346 0.14198250365871087 0.23086080368580453 0.18744427741405117 0.0010254671663260122 0.011654633617442983 0.06614272766298167 0.18744427741405117 0.26525823848649227 7.852830360809077e-05 0.001555527859401226 0.015386363253590088 0.07599775773306434 0.18744427741405117 3.0028751901985315e-06 0.00010367250011136624 0.0017872959519927589 0.015386363253590088 0.06614272766298167).

	1 to: points size do: [ :i |
		self
			assert: (distribution value: (points at: i))
			closeTo: (expectedPDF at: i) ]
]
