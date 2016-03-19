baselines
baseline10: spec
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'initial version'.
		spec author: 'WernerKassens'.
		spec timestamp: '2016-01-30T15:13:14.484483+01:00'.
		spec repository: 'http://smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main/'.

		spec project: 'SMark'	with: [ 
		  spec className: #ConfigurationOfSMark;
					versionString: '1.0.1';
					repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main' ].
		spec project: 'Roassal2' with: [  
		  spec className: 'ConfigurationOfRoassal2';
               versionString: #stable;
               repository: 'http://www.smalltalkhub.com/mc/ObjectProfile/Roassal2/main'].
		spec project: 'SciST' with: [  
		  spec className: 'ConfigurationOfSciSmalltalk';
               versionString: #stable;
               repository: 'http://smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main/';
					loads: #('Math-DHB-Numerical' 'Math-DHB-wk' 'Math-Number-Extensions')].

		spec package: 'Math-Tests-RealInterval-Compatibility'.
		spec package:'Math-RealIntervalCompatibility'.
		spec package: 'Math-Benchmarks-RealInterval'
			with: [spec requires: #('Math-RealInterval' 'Math-Tests-RealInterval' 'SMark' 'Math-RealIntervalCompatibility')].
		spec package: 'Math-RealInterval'with: [spec requires: #('Roassal2' 'SciST')].
		spec package: 'Math-Tests-RealInterval' with: [spec requires: #('Math-RealInterval' 'SciST' 'Roassal2')].

		spec group: 'test' with: #('Math-Tests-RealInterval-Compatibility' 'Math-Tests-RealInterval' 'Math-Benchmarks-RealInterval').
		spec group: 'core' with: #('Math-RealInterval' 'Math-RealIntervalCompatibility').
		spec group: 'default' with: #('Math-Tests-RealInterval-Compatibility').
		spec for: #'RILoadable' do:[ spec group: 'default' with: #('core' 'test')]].
	