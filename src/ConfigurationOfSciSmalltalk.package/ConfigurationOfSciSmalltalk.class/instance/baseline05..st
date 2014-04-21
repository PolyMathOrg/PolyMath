baselines
baseline05: spec 
        <version: '0.5-baseline'>
        spec for: #common do: [
                spec blessing: #baseline.
		    spec description: '1. repeated spec requires: dont work as it only remembers the last requires:, hence changed to arrays. 
		2. necessary requirement for Math-DHB-Numerical added, since DHB wouldnt work if loaded separately via the configuration.
		3. one requirement of Math-DHB-NumericalExtensions deleted, since it would result in a loop that metacello cant solve and it is more probable that a user downloads Math-DHB-Numerical alone, than that he downloads Math-DHB-NumericalExtensions alone.
		4. a necessary requirement added to Math-QuaternionExtensions'.
		    spec author: 'WernerKassens'.
		    spec timestamp: '4/20/2014 14:35'.
                spec repository: 'http://www.smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main'.    
                spec 
			"core"
			package: 'Math-Random';
			package: 'Math-KDTree';
			package: 'Math-ODE';
			package: 'Math-Complex';
			package: 'Math-Quaternion';
			package: 'Math-DHB-Numerical'with: [spec requires: #('Math-DHB-NumericalExtensions')];
			"extensions"
			package: 'Math-Number-Extensions';
			package: 'Math-Tests-Random' with: [spec requires: 'Math-Random'];
			package: 'Math-ComplexExtensions' with: [spec requires: #('Math-Complex' 'Math-DHB-Numerical' 'Math-Quaternion')];
			package: 'Math-DHB-NumericalExtensions' with: [spec requires: #('Math-Complex' 'Math-Quaternion')];
			package: 'Math-QuaternionExtensions' with: [spec requires: #('Math-DHB-Numerical' 'Math-Quaternion' 'Math-Complex')];
			"tests"
			package: 'Math-Tests-Complex' with: [spec requires: 'Math-ComplexExtensions'];
			package: 'Math-Tests-KDTree' with: [spec requires: 'Math-KDTree'];
			package: 'Math-Tests-DHB-Numerical' with: [spec requires: 'Math-DHB-NumericalExtensions'];
			package: 'Math-Tests-ODE' with: [spec requires: 'Math-ODE'];
			package: 'Math-Tests-Quaternion' with: [spec requires: 'Math-Quaternion'];
			"benchmarks"
			package: 'Math-Benchmarks-ODE' with: [spec requires: #( 'Math-ODE' 'SMark' 'XMLWriter')];
			package: 'Math-Benchmarks-KDTree' with: [spec requires: #( 'Math-KDTree' 'SMark' )];
			"accuracy"
			package: 'Math-Accuracy-ODE' with: [ spec requires: #( 'Math-ODE' 'XMLWriter')].
		
		spec project: 'SMark' with: [
			spec
				className: 'ConfigurationOfSMark';
				"versionString: '';"	
				repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main' ].
		spec project: 'XMLWriter' with: [
			spec
				className: 'ConfigurationOfXMLWriter';
				"versionString: '';"
				repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLWriter/main' ].

		spec
			group: 'default' with: #('Core' 'Extensions' 'Tests' 'Benchmarks' 'Accuracy');
                  group: 'Core' with: #( 'Math-Complex' 'Math-Quaternion' 'Math-DHB-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE');
			group: 'Tests' with: #('Math-Tests-DHB-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE' 'Math-Tests-KDTree');
                  group: 'Extensions' with: #('Math-ComplexExtensions' 'Math-Number-Extensions' 'Math-QuaternionExtensions' 'Math-DHB-NumericalExtensions');
			group: 'Benchmarks' with: #('Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree');
			group: 'Accuracy' with: 'Math-Accuracy-ODE']