baselines
baseline02: spec 
        <version: '0.2-baseline'>
	"make MetacelloToolBox happy, it translates the dot in the version string to a hyphen"
	"remove dependency on Math-All package"
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: 'http://www.smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main'.    
                spec 
			"core"
			package: 'Math-Random';
			package: 'Math-KDTree';
			package: 'Math-ODE';
			package: 'Math-Complex';
			package: 'Math-Quaternion';
			package: 'Math-DHB-Numerical';
			"extensions"
			package: 'Math-Number-Extensions';
			package: 'Math-Tests-Random' with: [spec requires: 'Math-Random'];
			package: 'Math-ComplexExtensions' with: [spec requires: 'Math-Complex'; requires: 'Math-DHB-Numerical'; requires: 'Math-Quaternion'];
			package: 'Math-DHB-NumericalExtensions' with: [spec requires: 'Math-Complex'; requires: 'Math-DHB-Numerical'; requires: 'Math-Quaternion'];
			package: 'Math-QuaternionExtensions' with: [spec requires: 'Math-DHB-Numerical'; requires: 'Math-Complex'];
			"tests"
			package: 'Math-Tests-Complex' with: [spec requires: 'Math-ComplexExtensions'];
			package: 'Math-Tests-DHB-Numerical' with: [spec requires: 'Math-DHB-NumericalExtensions'];
			package: 'Math-Tests-ODE' with: [spec requires: 'Math-ODE'];
			package: 'Math-Tests-Quaternion' with: [spec requires: 'Math-Quaternion'];
			"benchmarks"
			package: 'Math-Benchmarks-ODE' with: [spec requires: #( 'Math-ODE' 'SMark' )].	
		
		spec project: 'SMark' with: [
			spec
				className: 'ConfigurationOfBenchmarking';
				repository: 'http://squeaksource.com/SMark' ].

		spec
				group: 'default' with: #('Core' 'Extensions' 'Tests' 'Benchmarks');
                        group: 'Core' with: #( 'Math-Complex' 'Math-Quaternion' 'Math-DHB-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE');
				group: 'Tests' with: #('Math-Tests-DHB-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE');
                        group: 'Extensions' with: #('Math-ComplexExtensions' 'Math-Number-Extensions' 'Math-QuaternionExtensions' 'Math-DHB-NumericalExtensions');
				group: 'Benchmarks' with: 'Math-Benchmarks-ODE'].