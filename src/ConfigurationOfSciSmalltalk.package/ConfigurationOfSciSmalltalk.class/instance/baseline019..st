baselines
baseline019: spec
	<version: '0.19-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main'.
		spec 
			project: 'StatPseudoCollections' with: [
				spec
					className: #ConfigurationOfDaliotsPlayground;
					versionString: '23.6';
					loads: #('StatPseudoCollections' );
					repository: 'http://smalltalkhub.com/mc/HwaJong/DaliotsPlayground/main' ];
			project: 'SMark' with: [
				spec
					className: #ConfigurationOfSMark;
					repository: 'http://smalltalkhub.com/mc/StefanMarr/SMark/main' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					repository: 'http://smalltalkhub.com/mc/PharoExtras/XMLWriter/main' ];
			project: 'ArbitraryPrecisionFl' with: [
				spec
					className: #ConfigurationOfArbitraryPrecisionFloat;
					loads: #('Core' 'Tests' );
					repository: 'http://www.squeaksource.com/ArbitraryPrecisionFl' ].
		spec 
			package: 'Math-Random';
			package: 'Math-KDTree';
			package: 'Math-Complex';
			package: 'Math-Quaternion' with: [
				spec requires: #('Math-Complex' ). ];
			package: 'Math-DHB-Numerical';
			package: 'Math-FastFourierTransform' with: [
				spec requires: #('Math-Complex' ). ];
			package: 'Math-ComplexExtensions' with: [
				spec requires: #('Math-Complex' 'Math-DHB-Numerical' ). ];
			package: 'Math-DHB-NumericalExtensions' with: [
				spec requires: #('Math-DHB-Numerical' ). ];
			package: 'Math-ODE' with: [
				spec requires: #('Math-DHB-Numerical' 'Math-DHB-NumericalExtensions' ). ];
			package: 'Math-QuaternionExtensions' with: [
				spec requires: #('Math-DHB-Numerical' 'Math-Quaternion' ). ];
			package: 'Math-DHB-wk' with: [
				spec requires: #('Math-DHB-Numerical' ). ];
			package: 'Math-AutomaticDifferenciation' with: [
				spec requires: #('Math-DHB-Numerical' ). ];
			package: 'Math-Tests-Random' with: [
				spec requires: #('Math-Random' ). ];
			package: 'Math-Tests-Complex' with: [
				spec requires: #('Math-ComplexExtensions' ). ];
			package: 'Math-Tests-KDTree' with: [
				spec requires: #('Math-KDTree' ). ];
			package: 'Math-Tests-DHB-Numerical' with: [
				spec requires: #('Math-DHB-Numerical' ). ];
			package: 'Math-Tests-ODE' with: [
				spec requires: #('Math-ODE' ). ];
			package: 'Math-Tests-Quaternion' with: [
				spec requires: #('Math-Quaternion' ). ];
			package: 'Math-Tests-DHB-wk' with: [
				spec requires: #('Math-DHB-wk' ). ];
			package: 'Math-Tests-AutomaticDifferenciation' with: [
				spec requires: #('Math-AutomaticDifferenciation' ). ];
			package: 'Math-Tests-FastFourierTransform' with: [
				spec requires: #('Math-FastFourierTransform' 'Math-DHB-Numerical' ). ];
			package: 'Math-Accuracy-Core';
			package: 'Math-Tests-Accuracy' with: [
				spec requires: #('Math-Accuracy-Core' ). ];
			package: 'Math-FunctionFit' with: [
				spec requires: #('Math-DHB-Numerical' 'Math-Accuracy-Core' #'Math-Core' ). ];
			package: 'Math-Tests-FunctionFit' with: [
				spec requires: #('Math-FunctionFit' 'Math-DHB-wk' ). ];
			package: 'Math-Benchmarks-KDTree' with: [
				spec requires: #('Math-KDTree' 'SMark' ). ];
			package: 'Math-Accuracy-ODE' with: [
				spec requires: #('Math-ODE' 'XMLWriter' ). ];
			package: 'Math-Benchmarks-ODE' with: [
				spec requires: #('Math-ODE' 'SMark' 'XMLWriter' ). ];
			package: 'Math-Number-Extensions';
			package: #'Math-Core';
			package: #'Math-StatisticalMoments' with: [
				spec requires: #(#'Math-Core' ). ].
		spec 
			group: 'default' with: #('Core' 'Extensions' 'Tests' 'Benchmarks' 'Accuracy' 'StatPseudoCollections' );
			group: 'Core' with: #('Math-Complex' 'Math-Quaternion' 'Math-DHB-Numerical' 'Math-Random' 'Math-KDTree' 'Math-ODE' 'ArbitraryPrecisionFl' 'Math-FastFourierTransform' );
			group: 'Tests' with: #('Math-Tests-DHB-Numerical' 'Math-Tests-Complex' 'Math-Tests-Quaternion' 'Math-Tests-Random' 'Math-Tests-ODE' 'Math-Tests-KDTree' 'Math-Tests-DHB-wk' 'Math-Tests-FunctionFit' 'Math-Tests-AutomaticDifferenciation' 'Math-Tests-FastFourierTransform' 'Math-Tests-Accuracy' );
			group: 'Extensions' with: #('Math-ComplexExtensions' 'Math-Number-Extensions' 'Math-QuaternionExtensions' 'Math-DHB-NumericalExtensions' 'Math-DHB-wk' 'Math-FunctionFit' 'Math-AutomaticDifferenciation' );
			group: 'Benchmarks' with: #('Math-Benchmarks-ODE' 'Math-Benchmarks-KDTree' );
			group: 'Accuracy' with: #('Math-Accuracy-ODE' 'Math-Accuracy-Core' ). ].
