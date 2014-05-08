baselines
baseline09: spec 
        <version: '0.9-baseline'>
        spec for: #common do: [
                spec blessing: #baseline.
		    spec description: 'changes for squeak compatibility'.
		    spec author: 'WernerKassens'.
		    spec timestamp: '5/8/2014 17:35'.
                spec repository: 'http://www.smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main'.    
                spec 
			"core"
			package: 'Math-Random';
			package: 'Math-KDTree';
			package: 'Math-ODE';
			package: 'Math-Complex';
			package: 'Math-Quaternion' with: [spec requires: 'Math-Complex'];
			package: 'Math-DHB-Numerical';
			"extensions"
			package: 'Math-ComplexExtensions' with: [spec requires: #('Math-Complex' 'Math-DHB-Numerical')];
			package: 'Math-DHB-NumericalExtensions' with: [spec requires: 'Math-DHB-Numerical'];
			package: 'Math-QuaternionExtensions' with: [spec requires: #('Math-DHB-Numerical' 'Math-Quaternion')];
			package: 'Math-DHB-wk' with: [spec requires: 'Math-DHB-Numerical'];
			"tests"
			package: 'Math-Tests-Random' with: [spec requires: 'Math-Random'];
			package: 'Math-Tests-Complex' with: [spec requires: 'Math-ComplexExtensions'];
			package: 'Math-Tests-KDTree' with: [spec requires: 'Math-KDTree'];
			package: 'Math-Tests-DHB-Numerical' with: [spec requires: 'Math-DHB-Numerical'];
			package: 'Math-Tests-ODE' with: [spec requires: 'Math-ODE'];
			package: 'Math-Tests-Quaternion' with: [spec requires: 'Math-Quaternion'];
			package: 'Math-Tests-DHB-wk' with: [spec requires: 'Math-DHB-wk'];

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
			group: 'Tests' with: #('Math-Tests-DHB-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE' 'Math-Tests-KDTree' 'Math-Tests-DHB-wk');
                  group: 'Extensions' with: #('Math-ComplexExtensions' 'Math-Number-Extensions' 'Math-QuaternionExtensions' 'Math-DHB-NumericalExtensions' 'Math-DHB-wk');
			group: 'Benchmarks' with: #('Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree');
			group: 'Accuracy' with: 'Math-Accuracy-ODE'].
	  spec for: #'pharo' do: [spec package: 'Math-Number-Extensions' ].
	  spec for: #'squeak' do: [
		spec group: 'Extensions' overrides: #('Math-ComplexExtensions' 'Math-QuaternionExtensions'  'Math-DHB-NumericalExtensions' 'Math-DHB-wk');
		 	package: 'Math-SqueakPrerequisite';
			package: 'Math-ODE' with: [ spec requires: 'Math-SqueakPrerequisite'];
			package: 'Math-Tests-DHB-Numerical' with: [ spec requires: 'Math-SqueakPrerequisite'];
			package: 'Math-Tests-KDTree' with: [ spec requires: 'Math-SqueakPrerequisite'];
			package: 'Math-Tests-Random' with: [ spec requires: 'Math-SqueakPrerequisite'] ].
