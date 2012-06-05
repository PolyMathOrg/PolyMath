baselines
baseline102: spec 
        <version: '1.02-baseline'>
        "remove dependency on Math-All package"
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: 'http://ss3.gemstone.com/ss/SciSmalltalk'.    
                spec 
			"core"
			package: 'Math-DHB-Numerical';
			package: 'Math-Random';
			package: 'Math-KDTree';
			package: 'Math-Complex';
			package: 'Math-Quaternion';
			package: 'Math-ODE';
			"extensions"
			package: 'Math-Number-Extensions.Pharo';
			package: 'Math-RandomTests' with: [spec requires: 'Math-Random'];
			package: 'Math-Complex-Extensions' with: [spec requires: 'Math-Complex'; requires: 'Math-DHB-Numerical'; requires: 'Math-Quaternion'];
			package: 'Math-DHB-Numerical-Extensions' with: [spec requires: 'Math-Complex'; requires: 'Math-DHB-Numerical'; requires: 'Math-Quaternion'];
			package: 'Math-Extensions';
			package: 'Math-Quaternion-Extensions' with: [spec requires: 'Math-DHB-Numerical'; requires: 'Math-Complex'];
			"tests"
			package: 'Math-ComplexTests' with: [spec requires: 'Math-Complex-Extensions'];
			package: 'Math-DHB-NumericalTests' with: [spec requires: 'Math-DHB-Numerical-Extensions'];
			package: 'Math-ODETests' with: [spec requires: 'Math-ODE'];
			package: 'Math-QuaternionTests' with: [spec requires: 'Math-Quaternion'];
			package: 'Math-RandomTests' with: [spec requires: 'Math-Random'].
				

		spec
				group: 'default' with: #('Core' 'Extensions' 'Tests');
                        group: 'Core' with: #('Math-DHB-Numerical' 'Math-Complex' 'Math-Quaternion' 'Math-Random' 'Math-KDTree' 'Math-ODE');
				group: 'Tests' with: #('Math-DHB-NumericalTests' 'Math-ComplexTests' 'Math-QuaternionTests' 'Math-RandomTests' 'Math-ODETests');
                        group: 'Extensions' with: #('Math-Extensions' 'Math-Complex-Extensions' 'Math-Number-Extensions.Pharo' 'Math-Quaternion-Extensions' 'Math-DHB-Numerical-Extensions'). ].