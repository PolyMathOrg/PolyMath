versions
version032: spec
	<version: '0.32' imports: #('0.23-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.32: adding Math-Core-Process and Math-Core-Distribution'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '7/14/2015 14:54'.
		spec 
			project: 'StatPseudoCollections' with: '23.8';
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.9'.
		spec 
			package: 'Math-Core' with: 'Math-Core-StephaneDucasse.3';
			package: 'Math-Core-Process' with: 'Math-Core-Process-StephaneDucasse.1';
			package: 'Math-Core-Distribution' with: 'Math-Core-Distribution-StephaneDucasse.1';
			package: 'Math-Random' with: 'Math-Random-SergeStinckwich.14';
			package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.34';
			package: 'Math-Complex' with: 'Math-Complex-wernerkassens.9';
			package: 'Math-Quaternion' with: 'Math-Quaternion-wernerkassens.10';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-StephaneDucasse.41';
			package: 'Math-FastFourierTransform' with: 'Math-FastFourierTransform-wernerkassens.1';
			package: 'ExtendedNumberParser' with: 'ExtendedNumberParser-nice.1';
			package: 'ArbitraryPrecisionFloat' with: 'ArbitraryPrecisionFloat-SergeStinckwich.52';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-WernerKassens.4';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-StephaneDucasse.6';
			package: 'Math-ODE' with: 'Math-ODE-nice.30';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-WernerKassens.3';
			package: 'Math-DHB-wk' with: 'Math-DHB-wk-StephaneDucasse.9';
			package: 'Math-AutomaticDifferenciation' with: 'Math-AutomaticDifferenciation-wernerkassens.1';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-SergeStinckwich.4';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-HwaJong.5';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-wernerkassens.25';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-SergeStinckwich.13';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-nice.16';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-nice.3';
			package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-wernerkassens.5';
			package: 'Math-Tests-AutomaticDifferenciation' with: 'Math-Tests-AutomaticDifferenciation-WernerKassens.2';
			package: 'Math-Tests-FastFourierTransform' with: 'Math-Tests-FastFourierTransform-wernerkassens.1';
			package: 'ArbitraryPrecisionFloatTests' with: 'ArbitraryPrecisionFloatTests-nice.20';
			package: 'Math-Accuracy-Core' with: 'Math-Accuracy-Core-SergeStinckwich.1';
			package: 'Math-Tests-Accuracy' with: 'Math-Tests-Accuracy-SergeStinckwich.1';
			package: 'Math-FunctionFit' with: 'Math-FunctionFit-StephaneDucasse.2';
			package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-HwaJong.5';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-WernerKassens.8';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-StatisticalMoments' with: 'Math-StatisticalMoments-StephaneDucasse.2'. ].
