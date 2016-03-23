versions
version010: spec
	<version: '0.10' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'new version of Math-Tests-KDTree'.
		spec author: 'WernerKassens'.
		spec timestamp: '4/21/2014 08:20'.
		spec 
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.9'.
		spec 
			package: 'Math-Random' with: 'Math-Random-SergeStinckwich.7';
			package: 'Math-KDTree' with: 'Math-KDTree-WernerKassens.33';
			package: 'Math-ODE' with: 'Math-ODE-SergeStinckwich.29';
			package: 'Math-Complex' with: 'Math-Complex-DanielUber.6';
			package: 'Math-Quaternion' with: 'Math-Quaternion-YuriyTymchuk.6';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-WernerKassens.25';
			package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-SergeStinckwich.1';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-YuriyTymchuk.2';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-WernerKassens.3';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-DanielUber.1';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-SergeStinckwich.1';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-wk.20';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-WernerKassens.5';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-SergeStinckwich.15';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-SergeStinckwich.1';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-WernerKassens.8';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3'. ].
