versions
version100: spec
	<version: '0.100' imports: #('0.45-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.100'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2018-06-25T17:12:56.893861+01:00'.
		spec 
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.10'.
		spec 
			package: 'ExtendedNumberParser' with: 'ExtendedNumberParser-nice.1';
			package: 'Math-Accuracy-Core' with: 'Math-Accuracy-Core-SergeStinckwich.5';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-SergeStinckwich.7';
			package: 'Math-ArbitraryPrecisionFloat' with: 'Math-ArbitraryPrecisionFloat-SergeStinckwich.4';
			package: 'Math-AutomaticDifferenciation' with: 'Math-AutomaticDifferenciation-SergeStinckwich.5';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-SergeStinckwich.11';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-SergeStinckwich.8';
			package: 'Math-Chromosome' with: 'Math-Chromosome-SergeStinckwich.3';
			package: 'Math-Clustering' with: 'Math-Clustering-SergeStinckwich.5';
			package: 'Math-Complex' with: 'Math-Complex-SergeStinckwich.10';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-SergeStinckwich.9';
			package: 'Math-Core' with: 'Math-Core-OleksandrZaytsev.28';
			package: 'Math-Core-Distribution' with: 'Math-Core-Distribution-SergeStinckwich.14';
			package: 'Math-Core-Process' with: 'Math-Core-Process-SergeStinckwich.9';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-SergeStinckwich.79';
			package: 'Math-Polynomials' with: 'Math-Polynomials-SergeStinckwich.1';
			package: 'Math-Tests-Polynomials' with: 'Math-Tests-Polynomials-SergeStinckwich.1';
			package: 'Math-DistributionBeta' with: 'Math-DistributionBeta-OlehShyshkin.4';
			package: 'Math-DistributionForHistogram' with: 'Math-DistributionForHistogram-OlehShyshkin.5';
			package: 'Math-DistributionGamma' with: 'Math-DistributionGamma-OlehShyshkin.4';
			package: 'Math-FastFourierTransform' with: 'Math-FastFourierTransform-SergeStinckwich.4';
			package: 'Math-FunctionFit' with: 'Math-FunctionFit-SergeStinckwich.10';
			package: 'Math-KDTree' with: 'Math-KDTree-SergeStinckwich.36';
			package: 'Math-KernelSmoothing' with: 'Math-KernelSmoothing-SergeStinckwich.6';
			package: 'Math-KolmogorovSmirnov' with: 'Math-KolmogorovSmirnov-SergeStinckwich.5';
			package: 'Math-Matrix' with: 'Math-Matrix-SergeStinckwich.33';
			package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-SergeStinckwich.9';
			package: 'Math-ODE' with: 'Math-ODE-OlehShyshkin.33';
			package: 'Math-Physics-Constants' with: 'Math-Physics-Constants-SergeStinckwich.4';
			package: 'Math-PrincipalComponentAnalysis' with: 'Math-PrincipalComponentAnalysis-SergeStinckwich.8';
			package: 'Math-Quantile' with: 'Math-Quantile-SergeStinckwich.6';
			package: 'Math-Quaternion' with: 'Math-Quaternion-SergeStinckwich.11';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-SergeStinckwich.5';
			package: 'Math-Random' with: 'Math-Random-StephaneDucasse.17';
			package: 'Math-RandomDistributionBased' with: 'Math-RandomDistributionBased-SergeStinckwich.5';
			package: 'Math-Series' with: 'Math-Series-SergeStinckwich.5';
			package: 'Math-StatisticalMoments' with: 'Math-StatisticalMoments-OlehShyshkin.6';
			package: 'Math-TSNE' with: 'Math-TSNE-SergeStinckwich.1';
			package: 'Math-Tests-Accuracy' with: 'Math-Tests-Accuracy-SergeStinckwich.4';
			package: 'Math-Tests-ArbitraryPrecisionFloat' with: 'Math-Tests-ArbitraryPrecisionFloat-SergeStinckwich.1';
			package: 'Math-Tests-AutomaticDifferenciation' with: 'Math-Tests-AutomaticDifferenciation-SergeStinckwich.5';
			package: 'Math-Tests-Clustering' with: 'Math-Tests-Clustering-SergeStinckwich.7';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-SergeStinckwich.9';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-SergeStinckwich.51';
			package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-SergeStinckwich.11';
			package: 'Math-Tests-FastFourierTransform' with: 'Math-Tests-FastFourierTransform-SergeStinckwich.4';
			package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-SergeStinckwich.13';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-SergeStinckwich.31';
			package: 'Math-Tests-KolmogorovSmirnov' with: 'Math-Tests-KolmogorovSmirnov-SergeStinckwich.7';
			package: 'Math-Tests-Matrix' with: 'Math-Tests-Matrix-SergeStinckwich.20';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-SergeStinckwich.19';
			package: 'Math-Tests-Quantile' with: 'Math-Tests-Quantile-SergeStinckwich.4';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-OlehShyshkin.6';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-StephaneDucasse.14';
			package: 'Math-UtilsDataServer' with: 'Math-UtilsDataServer-OlehShyshkin.2'. ].
