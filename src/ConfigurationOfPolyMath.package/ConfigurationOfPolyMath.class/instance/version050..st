versions
version050: spec
	<version: '0.50' imports: #('0.33-baseline-broken' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.50: 
			- recovered lost PCA
			- Extracted Matrix
			- Grouped Matrix Tests but does not work'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '3/26/2016 21:07'.
		spec 
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.9'.
		spec 
			package: 'Math-Core' with: 'Math-Core-StephaneDucasse.12';
			package: 'Math-Core-Process' with: 'Math-Core-Process-StephaneDucasse.4';
			package: 'Math-Core-Distribution' with: 'Math-Core-Distribution-StephaneDucasse.9';
			package: 'Math-Chromosome' with: 'Math-Chromosome-StephaneDucasse.1';
			package: 'Math-PrincipalComponentAnalysis' with: 'Math-PrincipalComponentAnalysis-StephaneDucasse.2';
			package: 'Math-RandomDistributionBased' with: 'Math-RandomDistributionBased-StephaneDucasse.2';
			package: 'Math-UtilsDataServer' with: 'Math-UtilsDataServer-StephaneDucasse.1';
			package: 'Math-Clustering' with: 'Math-Clustering-StephaneDucasse.2';
			package: 'Math-Tests-Clustering' with: 'Math-Tests-Clustering-StephaneDucasse.3';
			package: 'Math-Series' with: 'Math-Series-StephaneDucasse.2';
			package: 'Math-DistributionGamma' with: 'Math-DistributionGamma-StephaneDucasse.3';
			package: 'Math-DistributionBeta' with: 'Math-DistributionBeta-StephaneDucasse.3';
			package: 'Math-DistributionForHistogram' with: 'Math-DistributionForHistogram-StephaneDucasse.2';
			package: 'Math-Random' with: 'Math-Random-StephaneDucasse.15';
			package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.34';
			package: 'Math-Complex' with: 'Math-Complex-wernerkassens.9';
			package: 'Math-Matrix' with: 'Math-Matrix-StephaneDucasse.1';
			package: 'Math-Tests-Matrix' with: 'Math-Tests-Matrix-StephaneDucasse.1';
			package: 'Math-Quaternion' with: 'Math-Quaternion-wernerkassens.10';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-StephaneDucasse.56';
			package: 'Math-FastFourierTransform' with: 'Math-FastFourierTransform-StephaneDucasse.2';
			package: 'ExtendedNumberParser' with: 'ExtendedNumberParser-nice.1';
			package: 'ArbitraryPrecisionFloat' with: 'ArbitraryPrecisionFloat-SergeStinckwich.52';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-StephaneDucasse.5';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-StephaneDucasse.8';
			package: 'Math-ODE' with: 'Math-ODE-StephaneDucasse.31';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-WernerKassens.3';
			package: 'Math-DHB-wk' with: 'Math-DHB-wk-WernerKassens.10';
			package: 'Math-AutomaticDifferenciation' with: 'Math-AutomaticDifferenciation-StephaneDucasse.2';
			package: 'Math-Quantile' with: 'Math-Quantile-wernerkassens.1';
			package: 'Math-KernelSmoothing' with: 'Math-KernelSmoothing-WernerKassens.2';
			package: 'Math-KolmogorovSmirnov' with: 'Math-KolmogorovSmirnov-WernerKassens.1';
			package: 'Math-Tests-KolmogorovSmirnov' with: 'Math-Tests-KolmogorovSmirnov-StephaneDucasse.2';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-StephaneDucasse.13';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-StephaneDucasse.6';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-StephaneDucasse.27';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-StephaneDucasse.27';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-StephaneDucasse.17';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-StephaneDucasse.5';
			package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-StephaneDucasse.8';
			package: 'Math-Tests-AutomaticDifferenciation' with: 'Math-Tests-AutomaticDifferenciation-StephaneDucasse.3';
			package: 'Math-Tests-FastFourierTransform' with: 'Math-Tests-FastFourierTransform-StephaneDucasse.2';
			package: 'ArbitraryPrecisionFloatTests' with: 'ArbitraryPrecisionFloatTests-SergeStinckwich.21';
			package: 'Math-Accuracy-Core' with: 'Math-Accuracy-Core-StephaneDucasse.3';
			package: 'Math-Tests-Accuracy' with: 'Math-Tests-Accuracy-StephaneDucasse.3';
			package: 'Math-FunctionFit' with: 'Math-FunctionFit-StephaneDucasse.3';
			package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-StephaneDucasse.6';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-StephaneDucasse.9';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-StephaneDucasse.5';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-StatisticalMoments' with: 'Math-StatisticalMoments-WernerKassens.5'. ].