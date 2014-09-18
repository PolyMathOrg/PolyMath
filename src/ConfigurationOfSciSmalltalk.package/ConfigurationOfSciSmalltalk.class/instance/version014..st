versions
version014: spec
	<version: '0.14' imports: #('0.11-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'Add last contributions of Werner'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/17/2014 10:55'.
		spec 
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.9'.
		spec 
			package: 'Math-Random' with: 'Math-Random-SergeStinckwich.10';
			package: 'Math-KDTree' with: 'Math-KDTree-WernerKassens.33';
			package: 'Math-ODE' with: 'Math-ODE-nice.30';
			package: 'Math-Complex' with: 'Math-Complex-nice.8';
			package: 'Math-Quaternion' with: 'Math-Quaternion-nice.9';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-WernerKassens.27';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-WernerKassens.4';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-WernerKassens.5';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-WernerKassens.3';
			package: 'Math-DHB-wk' with: 'Math-DHB-wk-WernerKassens.6';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-WernerKassens.2';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-nice.3';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-WernerKassens.23';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-WernerKassens.7';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-nice.16';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-nice.3';
			package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-WernerKassens.3';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-WernerKassens.8';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3';
			package: 'Math-AccuraryFramework' with:'Math-AccuracyFramework-WernerKassens.29';	
			package: 'Math-FunctionFit' with:'Math-FunctionFit-WernerKassens.1';
			package: 'Math-Tests-FunctionFit' with:'Math-Tests-FunctionFit-WernerKassens.1'.
			].

	spec for: #'pharo' do: [
		spec package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-WernerKassens.8'. ].

	spec for: #'squeak' do: [
		spec 
			package: 'Math-SqueakPrerequisite' with: 'Math-SqueakPrerequisite-wk.3'].
