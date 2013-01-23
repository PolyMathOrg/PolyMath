versions
version05: spec
	<version: '0.5' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'modified Random tests and fixed an error in MTGenerator
relaxed convergence bound on PoissonGenerator
added announcements/watchers to ODESolver 
changes to Math-ODE
Added Tableau Stepper'.
		spec author: 'DanielUber'.
		spec timestamp: '7/20/2012 13:04'.
		spec 
			package: 'Math-Random' with: 'Math-Random-DanielUber.6';
			package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.6';
			package: 'Math-ODE' with: 'Math-ODE-DanielUber.13';
			package: 'Math-Complex' with: 'Math-Complex-DanielUber.6';
			package: 'Math-Quaternion' with: 'Math-Quaternion-DanielUber.5';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-DanielUber.20';
			package: 'Math-Number-Extensions.Pharo' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-Test-Random' with: 'Math-Tests-Random-SergeStinckwich.1';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-DanielUber.1';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-DanielUber.2';
			package: 'Math-Extensions' with: 'Math-Extensions-DanielUber.3';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-DanielUber.1';
			package: 'Math-ComplexTests' with: 'Math-ComplexTests-DanielUber.5';
			package: 'Math-DHB-NumericalTests' with: 'Math-DHB-NumericalTests-DanielUber.7';
			package: 'Math-ODETests' with: 'Math-ODETests-DanielUber.11';
			package: 'Math-QuaternionTests' with: 'Math-QuaternionTests-DanielUber.4'. ].
