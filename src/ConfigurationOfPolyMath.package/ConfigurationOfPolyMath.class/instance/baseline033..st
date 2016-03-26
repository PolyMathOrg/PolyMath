baselines
baseline033: spec
	<version: '0.33-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: 'Extracting Maxtrix and tests from DHB and related'.
		   spec author: 'Stephane Ducasse'.
		   spec timestamp: '26 March 2016'.
			spec repository: 'http://www.smalltalkhub.com/mc/PolyMath/PolyMath/main'.
			spec
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
				package: 'Math-Core-Distribution' with: [ spec requires: #('Math-Core') ];
				
				package: 'Math-Chromosome' with: [ spec requires: #('Math-Core') ];
				
				package: 'Math-PrincipalComponentAnalysis' with: [ spec requires: #('Math-DHB-Numerical') ];
				
				package: 'Math-RandomDistributionBased' with: [ spec requires: #('Math-DHB-Numerical') ];
				
				package: 'Math-UtilsDataServer';
				
				
				package: 'Math-Clustering' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Core-Process' 'Math-Matrix') ];
				package: 'Math-Tests-Clustering' with: [ spec requires: #('Math-Clustering' 'Math-Core' 'Math-Core-Distribution' 'Math-UtilsDataServer') ];
				
				package: 'Math-Matrix' with: [ spec requires: #('Math-Core' 'Math-Core-Process')];
				package: 'Math-Test-Matrix' with: [ spec requires: #('Math-Core' 'Math-DHB-Numerical' 'Math-Matrix' 'Math-StatisticalMoments') ];
				
				
				package: 'Math-Series' with: [ spec requires: #('Math-Core-Process') ];
				
				package: 'Math-DistributionGamma' with: [ spec requires: #('Math-Core' 'Math-DHB-Numerical' 'Math-Series'  'Math-Core-Distribution') ];
				package: 'Math-DistributionBeta' with: [ spec requires: #('Math-DistributionGamma') ];
				
				
				package: 'Math-DistributionForHistogram' with: [ spec requires: #('Math-Core-Distribution' 'Math-DistributionGamma' 'Math-DistributionBeta' 'Math-DHB-Numerical') ];
				
				package: 'Math-Random';
				package: 'Math-Tests-Random' with: [ spec requires: #('Math-Random') ];
	
				package: 'Math-KDTree';
				
				package: 'Math-Complex';
				package: 'Math-ComplexExtensions' with: [ spec requires: #('Math-Complex' 'Math-Core' 'Math-DHB-Numerical') ];
	
				package: 'Math-Quaternion' with: [ spec requires: #('Math-Complex') ];
				package: 'Math-QuaternionExtensions' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Quaternion') ];
				
				
				package: 'Math-DHB-Numerical'
					with: [ 
							spec
								requires:
									#('Math-Core' 'Math-Core-Process' 'Math-Core-Distribution' 'Math-DistributionGamma' 'Math-DistributionBeta' 'Math-DistributionForHistogram' 'Math-StatisticalMoments' 'Math-Series' 'Math-Matrix') ];
								
				package: 'Math-FastFourierTransform' with: [ spec requires: #('Math-Complex') ];
				package: 'ExtendedNumberParser';
				package: 'ArbitraryPrecisionFloat' with: [ spec requires: #('ExtendedNumberParser') ];

				package: 'Math-DHB-NumericalExtensions' with: [ spec requires: #('Math-DHB-Numerical') ];
				package: 'Math-ODE' with: [ spec requires: #('Math-Matrix') ];
				
				package: 'Math-DHB-wk' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Matrix') ];
				
				
				package: 'Math-AutomaticDifferenciation' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Matrix') ];
				package: 'Math-Tests-AutomaticDifferenciation' with: [ spec requires: #('Math-AutomaticDifferenciation' 'Math-Matrix') ];
				
				package: 'Math-Quantile';
				package: 'Math-KernelSmoothing' with: [ spec requires: #('Math-Quantile' 'Math-Core-Distribution') ];
				
				
				package: 'Math-KolmogorovSmirnov' with: [ spec requires: #( 'Math-Core-Distribution' 'Math-DistributionBeta') ];
				package: 'Math-Tests-KolmogorovSmirnov' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Core-Distribution' 'Math-KolmogorovSmirnov') ];
				

			
				package: 'Math-Tests-Complex' with: [ spec requires: #('Math-ComplexExtensions') ];
				package: 'Math-Tests-KDTree' with: [ spec requires: #('Math-KDTree') ];
				
				package: 'Math-Tests-DHB-Numerical' with: [ spec requires: #('Math-Core' 'Math-Core-Distribution' 'Math-DistributionBeta' 'Math-DistributionGamma' 'Math-DistributionForHistogram' 'Math-StatisticalMoments' 'Math-DHB-Numerical' 'Math-UtilsDataServer' 'Math-Chromosome') ];
				package: 'Math-Tests-ODE' with: [ spec requires: #('Math-ODE') ];
				package: 'Math-Tests-Quaternion' with: [ spec requires: #('Math-Quaternion') ];
				package: 'Math-Tests-DHB-wk' with: [ spec requires: #('Math-DHB-wk') ];

				package: 'Math-Tests-FastFourierTransform'
					with: [ spec requires: #('Math-FastFourierTransform' 'Math-Core-Distribution') ];
				package: 'ArbitraryPrecisionFloatTests' with: [ spec requires: #('ArbitraryPrecisionFloat') ];
				
				
				package: 'Math-Accuracy-Core';
				package: 'Math-Tests-Accuracy' with: [ spec requires: #('Math-Accuracy-Core') ];
				
				package: 'Math-FunctionFit' with: [ spec requires: #('Math-DHB-Numerical' 'Math-Chromosome' 'Math-Accuracy-Core' 'Math-Core' 'Math-Matrix') ];
				package: 'Math-Tests-FunctionFit' with: [ spec requires: #('Math-FunctionFit' 'Math-DHB-wk') ];
				package: 'Math-Benchmarks-KDTree' with: [ spec requires: #('Math-KDTree' 'SMark') ];
				
				package: 'Math-Accuracy-ODE' with: [ spec requires: #('Math-ODE' 'XMLWriter') ];
				
				package: 'Math-Benchmarks-ODE' with: [ spec requires: #('Math-ODE' 'SMark' 'XMLWriter') ];
				
				package: 'Math-Number-Extensions';
				
				package: 'Math-StatisticalMoments' with: [ spec requires: #('Math-Core' 'Math-DistributionForHistogram') ].
				
				
				
			spec
				group: 'default' with: #('Core' 'Extensions' 'Tests' 'Benchmarks' 'Accuracy');
				
				group: 'Core'
					with:
						#('Math-Complex' 'Math-Quaternion' 'Math-DHB-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE' 'ArbitraryPrecisionFloat' 'Math-FastFourierTransform' 'ExtendedNumberParser' 'Math-Quantile' );
						
				group: 'Tests'
					with:
						#('Math-Tests-Clustering' 'Math-Tests-DHB-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE' 'Math-Tests-KDTree' 'Math-Tests-DHB-wk' 'Math-Tests-FunctionFit' 'Math-Tests-AutomaticDifferenciation' 'Math-Tests-FastFourierTransform' 'Math-Tests-Accuracy' 'ArbitraryPrecisionFloatTests' 'Math-Tests-KolmogorovSmirnov');
				
				group: 'Extensions'
					with:
						#('Math-Clustering' 'Math-ComplexExtensions' 'Math-Number-Extensions' 'Math-QuaternionExtensions' 'Math-Chromosome' 'Math-DHB-NumericalExtensions' 'Math-DHB-wk' 'Math-PrincipalComponentAnalysis' 'Math-FunctionFit' 'Math-AutomaticDifferenciation' 'Math-KernelSmoothing' 'Math-RandomDistributionBased' 'Math-KolmogorovSmirnov');
						
				group: 'Benchmarks' with: #('Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree');
				
				group: 'Accuracy' with: #('Math-Accuracy-ODE' 'Math-Accuracy-Core') ]