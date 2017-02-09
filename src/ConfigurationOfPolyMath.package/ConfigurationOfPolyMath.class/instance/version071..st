versions
version071: spec
	<version: '0.71' imports: #('0.38-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.71'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2/9/2017 15:55'.
		spec 
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.9'.
		spec 
			package: 'Math-Core' with: 'Math-Core-OlehShyshkin.14';
			package: 'Math-Core-Process' with: 'Math-Core-Process-OlehShyshkin.7';
			package: 'Math-Core-Distribution' with: 'Math-Core-Distribution-OlehShyshkin.13';
			package: 'Math-Physics-Constants' with: 'Math-Physics-Constants-SergeStinckwich.4';
			package: 'Math-Chromosome' with: 'Math-Chromosome-OlehShyshkin.2';
			package: 'Math-UtilsDataServer' with: 'Math-UtilsDataServer-OlehShyshkin.2';
			package: 'Math-Series' with: 'Math-Series-OlehShyshkin.4';
			package: 'Math-DistributionGamma' with: 'Math-DistributionGamma-OlehShyshkin.4';
			package: 'Math-DistributionBeta' with: 'Math-DistributionBeta-OlehShyshkin.4';
			package: 'Math-DistributionForHistogram' with: 'Math-DistributionForHistogram-OlehShyshkin.5';
			package: 'Math-Random' with: 'Math-Random-StephaneDucasse.17';
			package: 'Math-KDTree' with: 'Math-KDTree-SergeStinckwich.35';
			package: 'Math-Complex' with: 'Math-Complex-wernerkassens.9';
			package: 'Math-Quaternion' with: 'Math-Quaternion-wernerkassens.10';
			package: 'Math-FastFourierTransform' with: 'Math-FastFourierTransform-StephaneDucasse.2';
			package: 'ExtendedNumberParser' with: 'ExtendedNumberParser-nice.1';
			package: 'Math-ArbitraryPrecisionFloat' with: 'Math-ArbitraryPrecisionFloat-SergeStinckwich.1';
			package: 'Math-Quantile' with: 'Math-Quantile-SergeStinckwich.6';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-StephaneDucasse.14';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-StephaneDucasse.27';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-OlehShyshkin.6';
			package: 'Math-Tests-ArbitraryPrecisionFloat' with: 'Math-Tests-ArbitraryPrecisionFloat-SergeStinckwich.1';
			package: 'Math-Accuracy-Core' with: 'Math-Accuracy-Core-SergeStinckwich.4';
			package: 'Math-Tests-Accuracy' with: 'Math-Tests-Accuracy-StephaneDucasse.3';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-StephaneDucasse.9';
			package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-StatisticalMoments' with: 'Math-StatisticalMoments-OlehShyshkin.6';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-SergeStinckwich.2';
			package: 'Math-FunctionFit' with: 'Math-FunctionFit-SergeStinckwich.6';
			package: 'Math-Tests-FastFourierTransform' with: 'Math-Tests-FastFourierTransform-OlehShyshkin.3';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-OlehShyshkin.33';
			package: 'Math-KolmogorovSmirnov' with: 'Math-KolmogorovSmirnov-OlehShyshkin.2';
			package: 'Math-Tests-KolmogorovSmirnov' with: 'Math-Tests-KolmogorovSmirnov-OlehShyshkin.3';
			package: 'Math-KernelSmoothing' with: 'Math-KernelSmoothing-OlehShyshkin.3';
			package: 'Math-AutomaticDifferenciation' with: 'Math-AutomaticDifferenciation-OlehShyshkin.3';
			package: 'Math-Tests-AutomaticDifferenciation' with: 'Math-Tests-AutomaticDifferenciation-OlehShyshkin.4';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-SergeStinckwich.5';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-OlehShyshkin.9';
			package: 'Math-ODE' with: 'Math-ODE-OlehShyshkin.33';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-StephaneDucasse.6';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-OlehShyshkin.18';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-SergeStinckwich.7';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-OlehShyshkin.7';
			package: 'Math-PrincipalComponentAnalysis' with: 'Math-PrincipalComponentAnalysis-OlehShyshkin.3';
			package: 'Math-RandomDistributionBased' with: 'Math-RandomDistributionBased-OlehShyshkin.3';
			package: 'Math-Clustering' with: 'Math-Clustering-OlehShyshkin.4';
			package: 'Math-Tests-Clustering' with: 'Math-Tests-Clustering-OlehShyshkin.6';
			package: 'Math-Test-Matrix' with: 'Math-Test-Matrix-OlehShyshkin.2';
			package: 'Math-Matrix' with: 'Math-Matrix-SergeStinckwich.4';
			package: 'Math-DHB-wk' with: 'Math-DHB-wk-SergeStinckwich.13';
			package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-SergeStinckwich.8';
			package: 'Math-Tests-Quantile' with: 'Math-Tests-Quantile-SergeStinckwich.4';
			package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-StephaneDucasse.9'. ].
