versions
version027: spec
	<version: '0.27' imports: #('0.19-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #development.
			spec description: 'version 0.27'.
			spec author: 'StephaneDucasse'.
			spec timestamp: '7/12/2015 11:31'.
			spec
				project: 'SMark' with: '1.0.1';
				project: 'XMLWriter' with: '2.6.3';
				project: 'ArbitraryPrecisionFl' with: '1.1.1';
				project: 'StatPseudoCollections' with: '23.6'.
			spec
				package: 'Math-Random' with: 'Math-Random-SergeStinckwich.14';
				package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.34';
				package: 'Math-Complex' with: 'Math-Complex-wernerkassens.9';
				package: 'Math-Quaternion' with: 'Math-Quaternion-wernerkassens.10';
				package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-StephaneDucasse.39';
				package: 'Math-FastFourierTransform' with: 'Math-FastFourierTransform';
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
				package: 'Math-Tests-AutomaticDifferenciation' with: 'Math-Tests-AutomaticDifferenciation-wernerkassens.1';
				package: 'Math-Tests-FastFourierTransform' with: 'Math-Tests-FastFourierTransform';
				package: 'Math-Accuracy-Core' with: 'Math-Accuracy-Core-SergeStinckwich.1';
				package: 'Math-Tests-Accuracy' with: 'Math-Tests-Accuracy';
				package: 'Math-FunctionFit' with: 'Math-FunctionFit-StephaneDucasse.2';
				package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-HwaJong.5';
				package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-WernerKassens.8';
				package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3';
				package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
				package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
				package: #'Math-Core' with: 'Math-Core-StephaneDucasse.1';
				package: #'Math-StatisticalMoments' with: 'Math-StatisticalMoments-StephaneDucasse.1' ]