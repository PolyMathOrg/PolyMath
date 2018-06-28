Class {
	#name : #PMStatisticsBugs,
	#superclass : #TestCase,
	#category : 'Math-Tests-DHB-Numerical'
}

{ #category : #tests }
PMStatisticsBugs >> testBetaDistribution [
	| d |
	d := PMBetaDistribution shape: 0.9 shape: 0.9.
	self assert: (d distributionValue: 1.0 successor) equals: 1.
	self assert: (d distributionValue: 4) equals: 1.
	self assert: (d distributionValue: 0.0 predecessor) equals: 0.
	self assert: (d distributionValue: -2) equals: 0
]

{ #category : #tests }
PMStatisticsBugs >> testCauchyDistribution [
	| a |
	a := PMCauchyDistribution shape: -40.2 scale: 2.1.
	"this line produced an error:"
	self
		assert: (a inverseDistributionValue: 0)
		equals: Float infinity negated.
	self assert: (a inverseDistributionValue: 1) equals: Float infinity
]

{ #category : #tests }
PMStatisticsBugs >> testFisherTippet [
	| d |
	d := PMFisherTippettDistribution new.
	self assert: ((d integralFrom: -10 to: -0.1) closeTo: (d distributionValue: -0.1)).
	self assert: ((d integralUpTo: -0.1) closeTo: (d distributionValue: -0.1)).
	self assert: ((d integralFrom: -10 to: 0.1) closeTo: (d distributionValue: 0.1))
]

{ #category : #tests }
PMStatisticsBugs >> testFisherTippet2 [
	| d |
	d := PMFisherTippettDistribution shape: -3 scale: 0.7.
	self assert: (d distributionValue: Float fmax) equals: 1.	"old version could do this, but new version also because #exp uses a primitive who takes care of overflow"
	self assert: (d distributionValue: Float fmax negated) equals: 0.
	self assert: (d distributionValue: -100) equals: 0.	"bug is here"
	self assert: (d distributionValue: 100) equals: 1.
	self assert: (d distributionValue: -3) equals: -1 exp
]

{ #category : #tests }
PMStatisticsBugs >> testProbabilityDensity [
	"tests PMProbabilityDensity>>inverseDistributionValue:."

	"testing this method usually produces (not always and not always the same) three different errors: 'zerodivide', ' 'Function''s derivative seems to be zero everywhere' and 'Supplied derivative is not correct', the latter happens in other cases than the documented one too, i just dont remember which ones they are and i was too lazy to construct them, one example is enough"

	| a b |
	a := PMNormalDistribution new: -20 sigma: 0.7.
	self assert: (a inverseDistributionValue: 0.5) equals: -20.
	"ocassionally 'Supplied derivative is not correct'"
	a := PMNormalDistribution new: 2 sigma: 0.7.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.8))
				equalsTo: 0.8).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.6))
				equalsTo: 0.6).
	"zerodivide"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"zerodivide"
	a := PMAsymptoticChiSquareDistribution degreeOfFreedom: 18.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.8))
				equalsTo: 0.8).
	"Supplied derivative is not correct"
	a := PMFisherSnedecorDistribution
		degreeOfFreedom: 100
		degreeOfFreedom: 200.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.8))
				equalsTo: 0.8).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.6))
				equalsTo: 0.6).
	"zerodivide"
	a := PMFisherSnedecorDistribution
		degreeOfFreedom: 5
		degreeOfFreedom: 6.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.8))
				equalsTo: 0.8).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.6))
				equalsTo: 0.6).
	"zerodivide"
	a := PMFisherTippettDistribution new.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.9))
				equalsTo: 0.9).
	"zerodivide"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.001))
				equalsTo: 0.001).
	"ok"
	a := PMFisherTippettDistribution shape: -3 scale: 0.7.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.9))
				equalsTo: 0.9).
	"zerodivide"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.4))
				equalsTo: 0.4).
	"zerodivide"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"zerodivide"
	a := PMChiSquareDistribution degreeOfFreedom: 3.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.7))
				equalsTo: 0.7).
	"zerodivide"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.004))
				equalsTo: 0.004).
	"zerodivide"
	a := PMChiSquareDistribution degreeOfFreedom: 300.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.7))
				equalsTo: 0.7).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.004))
				equalsTo: 0.004).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"zerodivide"
	a := PMLogNormalDistribution new.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.7))
				equalsTo: 0.7).
	"zerodivide"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.004))
				equalsTo: 0.004).
	"zerodivide"
	a := PMLogNormalDistribution new: 3 sigma: 1.4.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.7))
				equalsTo: 0.7).
	"zerodivide"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"zerodivide"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 1.0)) - 1) abs
				< 3e-7.
	"equalsTo: is a too strong condition in this case"
	a := PMLogNormalDistribution new: 3 sigma: 3.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.7))
				equalsTo: 0.7).
	"zerodivide"
	a := PMStudentDistribution degreeOfFreedom: 5.
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1)) equalsTo: 1).
	"zerodivide"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0)) equalsTo: 0).
	"well, ok"
	a := PMTriangularDistribution new: 0.6 from: -1 to: 3.
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1)) equalsTo: 1).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0)) equalsTo: 0).
	"ok"
	a := PMUniformDistribution from: 0 to: 3.
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1)) equalsTo: 1).
	"ok "
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0)) equalsTo: 0).
	"ok"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.333333))
				equalsTo: 0.333333).
	"ok"
	a := PMWeibullDistribution shape: 0.5 scale: 1.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.99))
				equalsTo: 0.99).
	"ok "
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.5))
				equalsTo: 0.5).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"ok"
	a := PMExponentialDistribution new.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.99))
				equalsTo: 0.99).
	"ok "
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.5))
				equalsTo: 0.5).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"ok"
	a := PMGammaDistribution shape: 2 scale: 1.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.99))
				equalsTo: 0.99).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.5))
				equalsTo: 0.5).
	"zerod"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"zerod"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"zerod"
	a := PMLaplaceDistribution new.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.99))
				equalsTo: 0.99).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"zerod"
	a := PMBetaDistribution shape: 2 shape: 3.1.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.9))
				equalsTo: 0.9).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.5))
				equalsTo: 0.5).
	"zerodivide"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1)) equalsTo: 1).
	"zerod"
	a := PMBetaDistribution shape: 0.9 shape: 0.9.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.9))
				equalsTo: 0.9).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.5))
				equalsTo: 0.5).
	"'Function''s derivative seems to be zero everywhere'"
	self assert: ((a inverseDistributionValue: 0) equalsTo: 0).
	"zerod"
	self assert: ((a inverseDistributionValue: 1) equalsTo: 1).
	"zerod"
	a := PMBetaDistribution shape: 9 shape: 0.29.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.9))
				equalsTo: 0.9).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.5))
				equalsTo: 0.5).
	"'Function''s derivative seems to be zero everywhere'"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self assert: ((a inverseDistributionValue: 1.0) equalsTo: 1).
	"zerod"
	a := PMCauchyDistribution shape: -40.2 scale: 2.1.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.9))
				equalsTo: 0.9).
	"ok"
	self assert: (a inverseDistributionValue: 0.5) equals: -40.2.
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0.0)) equalsTo: 0).
	"zerod, which in this case is ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1.0)) equalsTo: 1).
	"ok"

	"a:=KernelSmoothedDensity fromData: #(1 2 3 1 2.3 2.4). 
a epanechnikov.
self assert: ((a distributionValue: (a inverseDistributionValue: 0.9))equalsTo: 0.9)."
	"'Function''s derivative seems to be zero everywhere'"
	"self assert: ((a distributionValue: (a inverseDistributionValue: 0.5))equalsTo: 0.5)."
	"zerod"
	"self assert: ((a distributionValue: (a inverseDistributionValue: 0.0))equalsTo: 0)."
	" -0.13122605895944042"
	"ok"
	"self assert: ((a distributionValue: (a inverseDistributionValue: 1.0))equalsTo: 1)."
	"zerod"
	a := PMHistogram new.
	20 timesRepeat: [ a accumulate: 7.0 random ].
	b := PMHistogrammedDistribution histogram: a.
	self
		assert:
			((b distributionValue: (b inverseDistributionValue: 0.99))
				equalsTo: 0.99).
	"ok"
	self
		assert: ((b distributionValue: (b inverseDistributionValue: 0.0)) equalsTo: 0).
	"ok"
	self
		assert:
			((b distributionValue: (b inverseDistributionValue: 1.0) asFloat)
				equalsTo: 1)
	"ok"
]

{ #category : #tests }
PMStatisticsBugs >> testProbabilityDensityWithUnknownDistribution [
	| d |
	d := PMLogNormalDistribution new.
	self assert: ((d distributionValue: 1) closeTo: 0.5).
	self assert: ((d distributionValue: 3.602) closeTo: 0.9).
	self assert: ((d acceptanceBetween: 1 and: 3.602) closeTo: 0.4)
]
