versions
version07: spec
	<version: '0.7' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'KDTree has tests separated, new version of KDTree'.
		spec author: 'WernerKassens'.
		spec timestamp: '3/7/2014 14:39'.
		spec 
			project: 'SMark' with: '1.0.0';
			project: 'XMLWriter' with: '2.3.9'.
		spec 
			package: 'Math-Random' with: 'Math-Random-SergeStinckwich.7';
			package: 'Math-KDTree' with: 'Math-KDTree-wk.30';
			package: 'Math-ODE' with: 'Math-ODE-SergeStinckwich.29';
			package: 'Math-Complex' with: 'Math-Complex-DanielUber.6';
			package: 'Math-Quaternion' with: 'Math-Quaternion-YuriyTymchuk.6';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-YuriyTymchuk.22';
			package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-SergeStinckwich.1';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-YuriyTymchuk.2';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-DanielUber.2';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-DanielUber.1';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-SergeStinckwich.1';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-WernerKassens.14';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-SergeStinckwich.1';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-SergeStinckwich.15';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-SergeStinckwich.1';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3'. ].
