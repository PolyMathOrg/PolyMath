baselines
baseline024: spec
	<version: '0.23-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://www.smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main'.
			spec
				project: 'StatPseudoCollections'
					with: [ 
							spec
								className: #ConfigurationOfDaliotsPlayground;
								versionString: '23.8';
								loads: #('StatPseudoCollections');
								repository: 'http://smalltalkhub.com/mc/HwaJong/DaliotsPlayground/main' ];
				project: 'SMark'
					with: [ 
							spec
								className: #ConfigurationOfSMark;
								versionString: '1.0.1';
								repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main' ];
				project: 'XMLWriter'
					with: [ 
							spec
								className: #ConfigurationOfXMLWriter;
								versionString: '2.3.9';
								repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLWriter/main' ].
			spec
				package: 'Math-Core';
				package: 'Math-Core-Process';
				package: 'Math-Core-Distribution' with: [ spec requires: 'Math-Core' ];
				package: 'Math-Series';
				package: 'Math-DistributionGamma' with: [ spec requires: #('Math-Core-Distribution') ];
				package: 'Math-DistributionBeta' with: [ spec requires: #('Math-DistributionGamma') ];
				package: 'Math-DistributionForHistogram' with: [ spec requires: #('Math-Core-Distribution') ];
				package: 'Math-Random';
				package: 'Math-KDTree';
				package: 'Math-Complex';
				package: 'Math-Quaternion' with: [ spec requires: #('Math-Complex') ];
				package: 'Math-DHB-Numerical'
					with: [ 
							spec
								requires:
									#('Math-Core' 'Math-Core-Process' 'Math-Core-Distribution' 'Math-DistributionGamma' 'Math-DistributionBeta' 'Math-DistributionForHistogram' 'Math-StatisticalMoments' 'Math-Series') ];
				package: 'Math-FastFourierTransform' with: [ spec requires: #('Math-Complex') ];
				package: 'ExtendedNumberParser';
				package: 'ArbitraryPrecisionFloat' with: [ spec requires: #('ExtendedNumberParser') ];
				package: 'Math-ComplexExtensions' with: [ spec requires: #('Math-Complex' 'Math-DHB-Numerical') ];
				package: 'Math-DHB-NumericalExtensions' with: [ spec requires: #('Math-DHB-Numerical') ];
				package: 'Math-ODE' with: [ spec requires: #('Math-DHB-Numerical' 'Math-DHB-NumericalExtensions') ];
				package: 'Math-QuaternionExtensions' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Quaternion') ];
				package: 'Math-DHB-wk' with: [ spec requires: #('Math-DHB-Numerical') ];
				package: 'Math-AutomaticDifferenciation' with: [ spec requires: #('Math-DHB-Numerical') ];
				package: 'Math-Tests-Random' with: [ spec requires: #('Math-Random') ];
				package: 'Math-Tests-Complex' with: [ spec requires: #('Math-ComplexExtensions') ];
				package: 'Math-Tests-KDTree' with: [ spec requires: #('Math-KDTree') ];
				package: 'Math-Tests-DHB-Numerical' with: [ spec requires: #('Math-DHB-Numerical') ];
				package: 'Math-Tests-ODE' with: [ spec requires: #('Math-ODE') ];
				package: 'Math-Tests-Quaternion' with: [ spec requires: #('Math-Quaternion') ];
				package: 'Math-Tests-DHB-wk' with: [ spec requires: #('Math-DHB-wk') ];
				package: 'Math-Tests-AutomaticDifferenciation' with: [ spec requires: #('Math-AutomaticDifferenciation') ];
				package: 'Math-Tests-FastFourierTransform'
					with: [ spec requires: #('Math-FastFourierTransform' 'Math-DHB-Numerical') ];
				package: 'ArbitraryPrecisionFloatTests' with: [ spec requires: #('ArbitraryPrecisionFloat') ];
				package: 'Math-Accuracy-Core';
				package: 'Math-Tests-Accuracy' with: [ spec requires: #('Math-Accuracy-Core') ];
				package: 'Math-FunctionFit' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Accuracy-Core' 'Math-Core') ];
				package: 'Math-Tests-FunctionFit' with: [ spec requires: #('Math-FunctionFit' 'Math-DHB-wk') ];
				package: 'Math-Benchmarks-KDTree' with: [ spec requires: #('Math-KDTree' 'SMark') ];
				package: 'Math-Accuracy-ODE' with: [ spec requires: #('Math-ODE' 'XMLWriter') ];
				package: 'Math-Benchmarks-ODE' with: [ spec requires: #('Math-ODE' 'SMark' 'XMLWriter') ];
				package: 'Math-Number-Extensions';
				package: 'Math-StatisticalMoments' with: [ spec requires: #('Math-Core' 'Math-DistributionForHistogram') ].
			spec
				group: 'default' with: #('Core' 'Extensions' 'Tests' 'Benchmarks' 'Accuracy' 'StatPseudoCollections');
				group: 'Core'
					with:
						#('Math-Complex' 'Math-Quaternion' 'Math-DHB-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE' 'ArbitraryPrecisionFloat' 'Math-FastFourierTransform' 'ExtendedNumberParser');
				group: 'Tests'
					with:
						#('Math-Tests-DHB-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE' 'Math-Tests-KDTree' 'Math-Tests-DHB-wk' 'Math-Tests-FunctionFit' 'Math-Tests-AutomaticDifferenciation' 'Math-Tests-FastFourierTransform' 'Math-Tests-Accuracy' 'ArbitraryPrecisionFloatTests');
				group: 'Extensions'
					with:
						#('Math-ComplexExtensions' 'Math-Number-Extensions' 'Math-QuaternionExtensions' 'Math-DHB-NumericalExtensions' 'Math-DHB-wk' 'Math-FunctionFit' 'Math-AutomaticDifferenciation');
				group: 'Benchmarks' with: #('Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree');
				group: 'Accuracy' with: #('Math-Accuracy-ODE' 'Math-Accuracy-Core') ]