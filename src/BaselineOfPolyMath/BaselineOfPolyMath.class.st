"
PolyMath is a Smalltalk project, similar to existing scientific libraries like NumPy, SciPy for Python or SciRuby for Ruby. PolyMath already provide the following basic functionalities:

    complex and quaternions extensions,
    random number generators,
    fuzzy algorithms,
    KDE-trees,
    Didier Besset's numerical methods,
    Ordinary Differential Equation (ODE) solvers.

"
Class {
	#name : #BaselineOfPolyMath,
	#superclass : #BaselineOf,
	#category : #BaselineOfPolyMath
}

{ #category : #baseline }
BaselineOfPolyMath >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec blessing: #baseline.
			spec repository: 'github://PolyMathOrg/PolyMath/src'.
			spec
				baseline: 'SMark'
					with: [ spec repository: 'github://smarr/SMark:v1.0.4/repository' ];
				baseline: 'XMLWriter'
					with: [ spec
						repository: 'github://pharo-contributions/XML-XMLWriter:2.9.0/src' ].
			spec
				package: 'ExtendedNumberParser';
				package: 'Math-Accuracy-Core';
				package: 'Math-Accuracy-ODE'
					with: [ spec requires: #('Math-ODE' 'XMLWriter') ];
				package: 'Math-ArbitraryPrecisionFloat'
					with: [ spec requires: #('ExtendedNumberParser') ];
				package: 'Math-AutomaticDifferenciation'
					with: [ spec requires: #('Math-Numerical' 'Math-Matrix') ];
				package: 'Math-Benchmarks-KDTree'
					with: [ spec requires: #('Math-KDTree' 'SMark') ];
				package: 'Math-Benchmarks-ODE'
					with: [ spec requires: #('Math-ODE' 'SMark' 'XMLWriter') ];
				package: 'Math-Chromosome'
					with: [ spec requires: #('Math-Core') ];
				package: 'Math-Clustering'
					with:
						[ spec requires: #('Math-Numerical' 'Math-Core-Process' 'Math-Matrix') ];
				package: 'Math-Complex'
					with: [ spec requires: #('Math-Numerical' 'Math-Polynomials') ];
				package: 'Math-Core';
				package: 'Math-Core-Distribution'
					with: [ spec requires: #('Math-Core') ];
				package: 'Math-Core-Process';
				package: 'Math-Numerical'
					with: [ spec
						requires:
							#('Math-Core' 'Math-Core-Process' 'Math-Core-Distribution' 'Math-DistributionGamma' 'Math-DistributionBeta' 'Math-DistributionForHistogram' 'Math-StatisticalMoments' 'Math-Series') ];
				package: 'Math-Polynomials'
					with: [ spec
						requires:
							#('Math-Core' 'Math-Core-Process' 'Math-Core-Distribution' 'Math-DistributionGamma' 'Math-DistributionBeta' 'Math-DistributionForHistogram' 'Math-StatisticalMoments' 'Math-Series') ];
				package: 'Math-DistributionBeta'
					with: [ spec requires: #('Math-DistributionGamma') ];
				package: 'Math-DistributionForHistogram'
					with: [ spec requires: #('Math-Core-Distribution') ];
				package: 'Math-DistributionGamma'
					with: [ spec requires: #('Math-Core-Distribution') ];
				package: 'Math-FastFourierTransform'
					with: [ spec requires: #('Math-Complex') ];
				package: 'Math-FunctionFit'
					with: [ spec
						requires:
							#('Math-Numerical' 'Math-Chromosome' 'Math-Accuracy-Core' 'Math-Core' 'Math-Matrix' 'Math-Polynomials') ];
				package: 'Math-KDTree';
				package: 'Math-KernelSmoothing'
					with: [ spec
						requires: #('Math-Quantile' 'Math-Numerical' 'Math-Polynomials') ];
				package: 'Math-KolmogorovSmirnov'
					with: [ spec requires: #('Math-Numerical' 'Math-Polynomials') ];
				package: 'Math-Matrix';
				package: 'Math-Number-Extensions';
				package: 'Math-ODE'
					with:
						[ spec requires: #('Math-Numerical' 'Math-Matrix' 'Math-Polynomials') ];
				package: 'Math-Permutation'
					with: [ spec requires: #('Math-Core' 'Math-Matrix' 'Math-Core-Process') ];
				package: 'Math-Physics-Constants';
				package: 'Math-PrincipalComponentAnalysis'
					with:
						[ spec requires: #('Math-Numerical' 'Math-Matrix' 'Math-Polynomials') ];
				package: 'Math-Quantile';
				package: 'Math-Quaternion'
					with:
						[ spec requires: #('Math-Complex' 'Math-Numerical' 'Math-Polynomials') ];
				package: 'Math-Random';
				package: 'Math-Series';
				package: 'Math-StatisticalMoments'
					with: [ spec requires: #('Math-Core' 'Math-DistributionForHistogram') ];
				package: 'Math-TSNE';
				package: 'Math-Tests-Accuracy'
					with: [ spec requires: #('Math-Accuracy-Core') ];
				package: 'Math-Tests-ArbitraryPrecisionFloat'
					with: [ spec requires: #('Math-ArbitraryPrecisionFloat') ];
				package: 'Math-Tests-AutomaticDifferenciation'
					with: [ spec requires: #('Math-AutomaticDifferenciation' 'Math-Matrix') ];
				package: 'Math-Tests-Clustering'
					with: [ spec
						requires:
							#('Math-Clustering' 'Math-Core' 'Math-Core-Distribution' 'Math-UtilsDataServer') ];
				package: 'Math-Tests-Complex'
					with: [ spec requires: #('Math-Complex') ];
				package: 'Math-Tests-Core'
					with: [ spec requires: #('Math-Core') ];
				package: 'Math-Tests-Core-Process'
					with: [ spec requires: #('Math-Core-Process') ];
				package: 'Math-Tests-Numerical'
					with: [ spec requires: #('Math-Numerical' 'Math-UtilsDataServer') ];
				package: 'Math-Tests-FastFourierTransform'
					with: [ spec
						requires: #('Math-FastFourierTransform' 'Math-Numerical' 'Math-Polynomials') ];
				package: 'Math-Tests-FunctionFit';
				package: 'Math-Tests-KDTree'
					with: [ spec requires: #('Math-KDTree') ];
				package: 'Math-Tests-KernelSmoothing'
					with: [ spec requires: #('Math-KernelSmoothing') ];
				package: 'Math-Tests-KolmogorovSmirnov'
					with: [ spec
						requires: #('Math-Numerical' 'Math-KolmogorovSmirnov' 'Math-Polynomials') ];
				package: 'Math-Tests-Matrix'
					with: [ spec
						requires:
							#('Math-Core' 'Math-Numerical' 'Math-StatisticalMoments' 'Math-Matrix' 'Math-Polynomials') ];
				package: 'Math-Tests-Number-Extensions'
					with: [ spec requires: #('Math-Number-Extensions') ];
				package: 'Math-Tests-ODE' with: [ spec requires: #('Math-ODE') ];
				package: 'Math-Tests-Permutation'
					with: [ spec requires: #('Math-Permutation') ];
				package: 'Math-Tests-PrincipalComponentAnalysis'
					with: [ spec requires: #('Math-PrincipalComponentAnalysis') ];
				package: 'Math-Tests-Quantile'
					with: [ spec requires: #('Math-Quantile') ];
				package: 'Math-Tests-Polynomials'
					with: [ spec requires: #('Math-Polynomials') ];
				package: 'Math-Tests-Quaternion'
					with: [ spec requires: #('Math-Quaternion') ];
				package: 'Math-Tests-Random'
					with: [ spec requires: #('Math-Random') ];
				package: 'Math-Tests-TSNE'
					with: [ spec requires: #('Math-TSNE') ];
				package: 'Math-UtilsDataServer'.
			spec
				group: 'Accuracy'
					with: #('Math-Accuracy-ODE' 'Math-Accuracy-Core');
				group: 'Benchmarks'
					with: #('Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree');
				group: 'Core'
					with:
					#('Math-Complex' 'Math-Quaternion' 'Math-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE' 'Math-ArbitraryPrecisionFloat' 'Math-FastFourierTransform' 'ExtendedNumberParser' 'Math-Quantile' 'Math-Physics-Constants' 'Math-Polynomials' 'Math-TSNE' 'Math-Core-Process' 'Math-Core' 'Math-Core-Distribution');
				group: 'Extensions'
					with:
					#('Math-Clustering' 'Math-Number-Extensions' 'Math-Chromosome' 'Math-PrincipalComponentAnalysis' 'Math-FunctionFit' 'Math-AutomaticDifferenciation' 'Math-KernelSmoothing' 'Math-Permutation' 'Math-KolmogorovSmirnov');
				group: 'Tests'
					with:
					#('Math-Tests-Matrix' 'Math-Tests-Clustering' 'Math-Tests-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE' 'Math-Tests-KDTree' 'Math-Tests-FunctionFit' 'Math-Tests-AutomaticDifferenciation' 'Math-Tests-FastFourierTransform' 'Math-Tests-Accuracy' 'Math-Tests-ArbitraryPrecisionFloat' 'Math-Tests-KolmogorovSmirnov' 'Math-Tests-Quantile' 'Math-Tests-Polynomials' 'Math-Tests-PrincipalComponentAnalysis' 'Math-Tests-KernelSmoothing' 'Math-Tests-Number-Extensions' 'Math-Tests-Permutation' 'Math-Tests-TSNE' 'Math-Tests-Core-Process' 'Math-Tests-Core');
				group: 'default'
					with: #('Core' 'Extensions' 'Tests' 'Benchmarks' 'Accuracy') ]
]

{ #category : #accessing }
BaselineOfPolyMath >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]
