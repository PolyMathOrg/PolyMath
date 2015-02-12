versions
version019: spec
	<version: '0.19' imports: #('0.16-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'typo of DhbMaximumLikekihoodHistogramFit fixed'.
		spec author: 'HwaJong'.
		spec timestamp: ' 2015-02-12T17:54:29.643+09:00'.
		spec 
			project: 'SMark' with: '1.0.1';
			project: 'XMLWriter' with: '2.3.9';
			project: 'ArbitraryPrecisionFl' with:'1.0';
			project: 'StatPseudoCollections' with: '23.6'.
		spec 
			package: 'Math-Random' with: 'Math-Random-SergeStinckwich.10';
			package: 'Math-KDTree' with: 'Math-KDTree-wernerkassens.34';
			package: 'Math-ODE' with: 'Math-ODE-nice.30';
			package: 'Math-Complex' with: 'Math-Complex-wernerkassens.9';
			package: 'Math-Quaternion' with: 'Math-Quaternion-wernerkassens.10';
			package: 'Math-DHB-Numerical' with: [
				spec file: 'Math-DHB-Numerical-HwaJong.31'.
				spec postLoadDoIt: #'aliasToTypoClassNameDhbMaximumLikekihoodHistogramFit'];
			package: 'Math-ComplexExtensions' with: 'Math-ComplexExtensions-WernerKassens.4';
			package: 'Math-DHB-NumericalExtensions' with: 'Math-DHB-NumericalExtensions-WernerKassens.5';
			package: 'Math-QuaternionExtensions' with: 'Math-QuaternionExtensions-WernerKassens.3';
			package: 'Math-DHB-wk' with: 'Math-DHB-wk-wernerkassens.7';
			package: 'Math-Tests-Random' with: 'Math-Tests-Random-WernerKassens.2';
			package: 'Math-Tests-Complex' with: 'Math-Tests-Complex-nice.3';
			package: 'Math-Tests-KDTree' with: 'Math-Tests-KDTree-wernerkassens.24';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-HwaJong.10';
			package: 'Math-Tests-ODE' with: 'Math-Tests-ODE-nice.16';
			package: 'Math-Tests-Quaternion' with: 'Math-Tests-Quaternion-nice.3';
			package: 'Math-Tests-DHB-wk' with: 'Math-Tests-DHB-wk-wernerkassens.4';
			package: 'Math-Benchmarks-ODE' with: 'Math-Benchmarks-ODE-YuriyTymchuk.7';
			package: 'Math-Benchmarks-KDTree' with: 'Math-Benchmarks-KDTree-WernerKassens.8';
			package: 'Math-Accuracy-ODE' with: 'Math-Accuracy-ODE-YuriyTymchuk.3';
			package: 'Math-AccuracyFramework' with: 'Math-AccuracyFramework-wernerkassens.30';	
			package: 'Math-FunctionFit' with: 'Math-FunctionFit-WernerKassens.1';
			package: 'Math-Tests-FunctionFit' with: 'Math-Tests-FunctionFit-wernerkassens.2'].

	spec for: #'pharo' do: [
		spec package: 'Math-Number-Extensions' with: 'Math-Number-Extensions.Pharo-DanielUber.8' ].

	spec for: #'squeak' do: [
		spec 
			package: 'Math-SqueakPrerequisite' with: 'Math-SqueakPrerequisite-wk.3';
			package: 'Math-Tests-DHB-Numerical' with: 'Math-Tests-DHB-Numerical-WernerKassens.7'].
