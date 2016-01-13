versions
version039: spec
	<version: '0.39' imports: #('0.27-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #stable.
			spec description: 'Fix problems with Pharo 5.0'.
			spec author: 'Serge Stinckwich'.
			spec timestamp: '13/1/2016 11:30'.
			spec
				project: 'SMark' with: '1.0.1';
				project: 'XMLWriter' with: '2.3.9'.
			spec
				package: 'Math-Core' with: 'Math-Core-StephaneDucasse.4';
				package: 'Math-DistributionForHistogram' with: 'Math-DistributionForHistogram-StephaneDucasse.1';
				package: 'Math-DistributionBeta' with: 'Math-DistributionBeta-WernerKassens.2';
				package: 'Math-DistributionGamma' with: 'Math-DistributionGamma-StephaneDucasse.1';
				package: 'Math-Series' with: 'Math-Series-StephaneDucasse.2';
				package: 'Math-Core-Process' with: 'Math-Core-Process-StephaneDucasse.1';
				package: 'Math-Core-Distribution' with: 'Math-Core-Distribution-WernerKassens.5';
				package: 'Math-Random' with: 'Math-Random-SergeStinckwich.14';
				package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.34';
				package: 'Math-Complex' with: 'Math-Complex-wernerkassens.9';
				package: 'Math-Quaternion' with: 'Math-Quaternion-wernerkassens.10';
				package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-WernerKassens.47';
				package: 'Math-FastFourierTransform' with: 'Math-FastFourierTransform-wernerkassens.1';
				package: 'ExtendedNumberParser' with: 'ExtendedNumberParser-nice.1';
				package: 'ArbitraryPrecisionFloat' with: 'ArbitraryPrecisionFloat-SergeStinckwich.52';
				package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-WernerKassens.4';
				package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-StephaneDucasse.6';
				package: 'Math-ODE' with: 'Math-ODE-nice.30';
				package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-WernerKassens.3';
				package: 'Math-DHB-wk' with: 'Math-DHB-wk-WernerKassens.10';
				package: 'Math-AutomaticDifferenciation' with: 'Math-AutomaticDifferenciation-wernerkassens.1';
				package: 'Math-Tests-Random' with: 'Math-Tests-Random-WernerKassens.8';
				package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-HwaJong.5';
				package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-WernerKassens.26';
				package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-WernerKassens.21';
				package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-nice.16';
				package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-nice.3';
				package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-WernerKassens.6';
				package: 'Math-Tests-AutomaticDifferenciation' with: 'Math-Tests-AutomaticDifferenciation-WernerKassens.2';
				package: 'Math-Tests-FastFourierTransform' with: 'Math-Tests-FastFourierTransform-wernerkassens.1';
				package: 'ArbitraryPrecisionFloatTests' with: 'ArbitraryPrecisionFloatTests-SergeStinckwich.21';
				package: 'Math-Accuracy-Core' with: 'Math-Accuracy-Core-SergeStinckwich.1';
				package: 'Math-Tests-Accuracy' with: 'Math-Tests-Accuracy-SergeStinckwich.1';
				package: 'Math-FunctionFit' with: 'Math-FunctionFit-StephaneDucasse.2';
				package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-HwaJong.5';
				package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-WernerKassens.8';
				package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3';
				package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
				package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
				package: 'Math-StatisticalMoments' with: 'Math-StatisticalMoments-WernerKassens.5';
				package: 'Math-Quantile' with: 'Math-Quantile-wernerkassens.1';
				package: 'Math-KernelSmoothing' with: 'Math-KernelSmoothing-WernerKassens.2';
				package: 'Math-Tests-KolmogorovSmirnov' with:'Math-Tests-KolmogorovSmirnov-WernerKassens.1']