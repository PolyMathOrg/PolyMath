baselines
baseline102: spec 
        <version: '1.02-baseline'>
        "remove dependency on Math-All package"
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: 'http://ss3.gemstone.com/ss/SciSmalltalk'.    
                spec 
			"core"
			package: 'Math-Random';
			package: 'Math-KDTree';
			package: 'Math-ODE';
			package: 'Math-Complex';
			package: 'Math-Quaternion';
			package: 'Math-DHB-Numerical';
			"extensions"
			package: 'Math-Number-Extensions.Pharo';
			package: 'Math-RandomTests' with: [spec requires: 'Math-Random'];
			package: 'Math-ComplexExtensions' with: [spec requires: 'Math-Complex'; requires: 'Math-DHB-Numerical'; requires: 'Math-Quaternion'];
			package: 'Math-DHB-NumericalExtensions' with: [spec requires: 'Math-Complex'; requires: 'Math-DHB-Numerical'; requires: 'Math-Quaternion'];
			package: 'Math-Extensions';
			package: 'Math-QuaternionExtensions' with: [spec requires: 'Math-DHB-Numerical'; requires: 'Math-Complex'];
			"tests"
			package: 'Math-ComplexTests' with: [spec requires: 'Math-ComplexExtensions'];
			package: 'Math-DHB-NumericalTests' with: [spec requires: 'Math-DHB-NumericalExtensions'];
			package: 'Math-ODETests' with: [spec requires: 'Math-ODE'];
			package: 'Math-QuaternionTests' with: [spec requires: 'Math-Quaternion'];
			package: 'Math-RandomTests' with: [spec requires: 'Math-Random'].
				

		spec
				group: 'default' with: #('Core' 'Extensions' 'Tests');
                        group: 'Core' with: #( 'Math-Complex' 'Math-Quaternion' 'Math-DHB-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE');
				group: 'Tests' with: #('Math-DHB-NumericalTests' 'Math-ComplexTests' 'Math-QuaternionTests' 'Math-RandomTests' 'Math-ODETests');
                        group: 'Extensions' with: #('Math-Extensions' 'Math-ComplexExtensions' 'Math-Number-Extensions.Pharo' 'Math-QuaternionExtensions' 'Math-DHB-NumericalExtensions'). ].