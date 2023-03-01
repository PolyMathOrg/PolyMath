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
	spec for: #common do: [ "External dependencies"
		self
			sMark: spec;
			xmlWriter: spec;
			vectorMatrix: spec;
			randomNumbers: spec.

		spec
			package: 'ExtendedNumberParser';
			package: 'Math-Accuracy-Core';
			package: 'Math-Accuracy-ODE' with: [ spec requires: #( 'Math-ODE' 'XMLWriter' ) ];
			package: 'Math-ArbitraryPrecisionFloat' with: [ spec requires: #( 'ExtendedNumberParser' ) ];
			package: 'Math-AutomaticDifferenciation' with: [ spec requires: #( 'Math-Numerical' 'MathVectorMatrix' ) ];
			package: 'Math-Benchmarks-KDTree' with: [ spec requires: #( 'Math-KDTree' 'SMark' ) ];
			package: 'Math-Benchmarks-ODE' with: [ spec requires: #( 'Math-ODE' 'SMark' 'XMLWriter' ) ];
			package: 'Math-Chromosome' with: [ spec requires: #( 'MathVectorMatrix' ) ];
			package: 'Math-Clustering' with: [ spec requires: #( 'Math-Numerical' 'Math-Core-Process' 'MathVectorMatrix' ) ];
			package: 'Math-Complex' with: [ spec requires: #( 'Math-Numerical' 'Math-Polynomials' ) ];
			package: 'Math-Helpers';
			package: 'Math-Distributions' with: [ spec requires: #( 'MathVectorMatrix' 'Math-Quantile' 'Math-Core-Process' ) ];
			package: 'Math-Core-Process' with: [ spec requires: #( 'Math-Helpers' ) ];
			package: 'Math-Numerical'
			with: [ spec requires: #( 'MathVectorMatrix' 'Math-Helpers' 'Math-Core-Process' 'Math-Distributions' 'Math-StatisticalMoments'
					   'Math-Series' ) ];
			package: 'Math-Polynomials'
			with: [ spec requires: #( 'MathVectorMatrix' 'Math-Helpers' 'Math-Core-Process' 'Math-Distributions' 'Math-StatisticalMoments'
					   'Math-Series' ) ];
			package: 'Math-FastFourierTransform' with: [ spec requires: #( 'Math-Complex' ) ];
			package: 'Math-FunctionFit'
			with: [ spec requires: #( 'Math-Numerical' 'Math-Chromosome' 'Math-Accuracy-Core' 'MathVectorMatrix' 'Math-Helpers' 'Math-Polynomials' ) ];
			package: 'Math-KDTree';
			package: 'Math-Number-Extensions';
			package: 'Math-ODE' with: [ spec requires: #( 'Math-Numerical' 'MathVectorMatrix' 'Math-Polynomials' ) ];
			package: 'Math-Permutation' with: [ spec requires: #( 'MathVectorMatrix' 'Math-Core-Process' ) ];
			package: 'Math-Physics-Constants';
			package: 'Math-PrincipalComponentAnalysis' with: [ spec requires: #( 'Math-Numerical' 'MathVectorMatrix' 'Math-Polynomials' ) ];
			package: 'Math-Quantile';
			package: 'Math-Quaternion' with: [ spec requires: #( 'Math-Complex' 'Math-Numerical' 'Math-Polynomials' ) ];
			package: 'Math-Series';
			package: 'Math-StatisticalMoments' with: [ spec requires: #( 'Math-Helpers' 'Math-Distributions' ) ];
			package: 'Math-TSNE';
			package: 'Math-Tests-Accuracy' with: [ spec requires: #( 'Math-Accuracy-Core' ) ];
			package: 'Math-Tests-ArbitraryPrecisionFloat' with: [ spec requires: #( 'Math-ArbitraryPrecisionFloat' ) ];
			package: 'Math-Tests-AutomaticDifferenciation' with: [ spec requires: #( 'Math-AutomaticDifferenciation' 'MathVectorMatrix' ) ];
			package: 'Math-Tests-Clustering' with: [ spec requires: #( 'Math-Clustering' 'Math-Distributions' 'Math-UtilsDataServer' ) ];
			package: 'Math-Tests-Complex' with: [ spec requires: #( 'Math-Complex' ) ];
			package: 'Math-Tests-Distributions' with: [ spec requires: #( 'Math-Distributions' ) ];
			package: 'Math-Tests-Core-Process' with: [ spec requires: #( 'Math-Core-Process' ) ];
			package: 'Math-Tests-Numerical' with: [ spec requires: #( 'Math-Numerical' 'Math-UtilsDataServer' ) ];
			package: 'Math-Tests-FastFourierTransform' with: [ spec requires: #( 'Math-FastFourierTransform' 'Math-Numerical' 'Math-Polynomials' ) ];
			package: 'Math-Tests-FunctionFit';
			package: 'Math-Tests-KDTree' with: [ spec requires: #( 'Math-KDTree' ) ];
			package: 'Math-Tests-Number-Extensions' with: [ spec requires: #( 'Math-Number-Extensions' ) ];
			package: 'Math-Tests-ODE' with: [ spec requires: #( 'Math-ODE' ) ];
			package: 'Math-Tests-Permutation' with: [ spec requires: #( 'Math-Permutation' ) ];
			package: 'Math-Tests-PrincipalComponentAnalysis' with: [ spec requires: #( 'Math-PrincipalComponentAnalysis' ) ];
			package: 'Math-Tests-Quantile' with: [ spec requires: #( 'Math-Quantile' ) ];
			package: 'Math-Tests-Polynomials' with: [ spec requires: #( 'Math-Polynomials' ) ];
			package: 'Math-Tests-Quaternion' with: [ spec requires: #( 'Math-Quaternion' ) ];
			package: 'Math-Tests-TSNE' with: [ spec requires: #( 'Math-TSNE' ) ];
			package: 'Math-UtilsDataServer'.
		spec
			group: 'Accuracy' with: #( 'Math-Accuracy-ODE' 'Math-Accuracy-Core' );
			group: 'Benchmarks' with: #( 'Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree' );
			group: 'Core'
			with:
				#( 'Math-Complex' 'Math-Quaternion' 'Math-Numerical' 'MathRandomNumbers' 'Math-KDTree' 'Math-ODE' 'Math-ArbitraryPrecisionFloat'
				   'Math-FastFourierTransform' 'ExtendedNumberParser' 'Math-Quantile' 'Math-Physics-Constants' 'Math-Polynomials' 'Math-TSNE' 'Math-Core-Process'
				   'Math-Helpers' 'MathVectorMatrix' 'Math-Distributions' );
			group: 'Extensions'
			with: #( 'Math-Clustering' 'Math-Number-Extensions' 'Math-Chromosome' 'Math-PrincipalComponentAnalysis' 'Math-FunctionFit' 'Math-AutomaticDifferenciation'
				   'Math-Permutation' );
			group: 'Tests'
			with:
				#( 'Math-Tests-Clustering' 'Math-Tests-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-ODE' 'Math-Tests-KDTree' 'Math-Tests-FunctionFit'
				   'Math-Tests-AutomaticDifferenciation' 'Math-Tests-FastFourierTransform' 'Math-Tests-Accuracy' 'Math-Tests-ArbitraryPrecisionFloat'
				   'Math-Tests-Quantile' 'Math-Tests-Polynomials' 'Math-Tests-PrincipalComponentAnalysis' 'Math-Tests-Number-Extensions' 'Math-Tests-Permutation'
				   'Math-Tests-TSNE' 'Math-Tests-Core-Process' 'Math-Tests-Distributions' );
			group: 'default' with: #( 'Core' 'Extensions' 'Tests' 'Benchmarks' 'Accuracy' ) ].

	spec for: #( #'pharo6.x' #'pharo7.x' #'pharo8.x' #'pharo9.x' #'pharo10.x' ) do: [
		spec
			package: 'Math-Numerical' with: [ spec requires: #( 'Math-CompatibilityUpToPharo11' ) ];
			package: 'Math-Benchmarks-KDTree' with: [ spec requires: #( 'Math-CompatibilityUpToPharo11' ) ];
			package: 'Math-Tests-KDTree' with: [ spec requires: #( 'Math-CompatibilityUpToPharo11' ) ];
			package: 'Math-CompatibilityUpToPharo11' ]
]

{ #category : #accessing }
BaselineOfPolyMath >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]
]

{ #category : #dependencies }
BaselineOfPolyMath >> randomNumbers: spec [

	spec baseline: 'MathRandomNumbers' with: [ spec repository: 'github://PolyMathOrg/random-numbers:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfPolyMath >> sMark: spec [

	spec baseline: 'SMark' with: [ spec repository: 'github://smarr/SMark:v1.0.4' ]
]

{ #category : #dependencies }
BaselineOfPolyMath >> vectorMatrix: spec [

	spec baseline: 'MathVectorMatrix' with: [ spec repository: 'github://PolyMathOrg/vector-matrix:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfPolyMath >> xmlWriter: spec [

	spec baseline: 'XMLWriter' with: [ spec repository: 'github://pharo-contributions/XML-XMLWriter:2.9.x/src' ]
]
