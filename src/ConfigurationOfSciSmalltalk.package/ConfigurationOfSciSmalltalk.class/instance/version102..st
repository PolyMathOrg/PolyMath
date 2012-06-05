versions
version102: spec 
        <version: '1.02' imports: #('1.02-baseline') >
        
        spec for: #common do: [
		spec blessing: #release.
            spec 
			package: 'Math-Complex' with: 'Math-Complex-DanielUber.5';
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-DanielUber.1';
			package: 'Math-ComplexTests' with: 'Math-ComplexTests-DanielUber.5';
			package: 'Math-DHB-Numerical' with: 'Math-DHB-Numerical-DanielUber.17';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-DanielUber.2';
			package: 'Math-DHB-NumericalTests' with: 'Math-DHB-NumericalTests-DanielUber.7';
			package: 'Math-Extensions' with: 'Math-Extensions-DanielUber.3';
			package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.6';
			package: 'Math-Number-Extensions.Pharo' with: 'Math-Number-Extensions.Pharo-DanielUber.8';
			package: 'Math-ODE' with: 'Math-ODE-DanielUber.10';
			package: 'Math-ODETests' with: 'Math-ODETests-DanielUber.11';
			package: 'Math-Quaternion' with: 'Math-Quaternion-DanielUber.3';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-DanielUber.1';
			package: 'Math-QuaternionTests' with: 'Math-QuaternionTests-DanielUber.4';
			package: 'Math-Random' with: 'Math-Random-DanielUber.4';
			package: 'Math-RandomTests' with: 'Math-RandomTests-DanielUber.3'].