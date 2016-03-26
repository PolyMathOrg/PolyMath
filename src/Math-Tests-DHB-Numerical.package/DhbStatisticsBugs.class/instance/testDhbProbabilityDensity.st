tests
testDhbProbabilityDensity
	"tests DhbProbabilityDensity>>inverseDistributionValue:."

	"testing this method usually produces (not always and not always the same) three different errors: 'zerodivide', ' 'Function''s derivative seems to be zero everywhere' and 'Supplied derivative is not correct', the latter happens in other cases than the documented one too, i just dont remember which ones they are and i was too lazy to construct them, one example is enough"

	| a b |
	a := DhbNormalDistribution new: -20 sigma: 0.7.
	self assert: (a inverseDistributionValue: 0.5) equals: -20.
	"ocassionally 'Supplied derivative is not correct'"
	a := DhbNormalDistribution new: 2 sigma: 0.7.
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
	a := DhbAsymptoticChiSquareDistribution degreeOfFreedom: 18.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.8))
				equalsTo: 0.8).
	"Supplied derivative is not correct"
	a := DhbFisherSnedecorDistribution
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
	a := DhbFisherSnedecorDistribution
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
	a := DhbFisherTippettDistribution new.
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
	a := DhbFisherTippettDistribution shape: -3 scale: 0.7.
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
	a := DhbChiSquareDistribution degreeOfFreedom: 3.
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
	a := DhbChiSquareDistribution degreeOfFreedom: 300.
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
	a := DhbLogNormalDistribution new.
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
	a := DhbLogNormalDistribution new: 3 sigma: 1.4.
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
	a := DhbLogNormalDistribution new: 3 sigma: 3.
	self
		assert:
			((a distributionValue: (a inverseDistributionValue: 0.7))
				equalsTo: 0.7).
	"zerodivide"
	a := DhbStudentDistribution degreeOfFreedom: 5.
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1)) equalsTo: 1).
	"zerodivide"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0)) equalsTo: 0).
	"well, ok"
	a := DhbTriangularDistribution new: 0.6 from: -1 to: 3.
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 1)) equalsTo: 1).
	"ok"
	self
		assert: ((a distributionValue: (a inverseDistributionValue: 0)) equalsTo: 0).
	"ok"
	a := DhbUniformDistribution from: 0 to: 3.
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
	a := DhbWeibullDistribution shape: 0.5 scale: 1.
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
	a := DhbExponentialDistribution new.
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
	a := DhbGammaDistribution shape: 2 scale: 1.
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
	a := DhbLaplaceDistribution new.
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
	a := DhbBetaDistribution shape: 2 shape: 3.1.
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
	a := DhbBetaDistribution shape: 0.9 shape: 0.9.
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
	a := DhbBetaDistribution shape: 9 shape: 0.29.
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
	a := DhbCauchyDistribution shape: -40.2 scale: 2.1.
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
	a := DhbHistogram new.
	20 timesRepeat: [ a accumulate: 7.0 random ].
	b := DhbHistogrammedDistribution histogram: a.
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