versions
version12: spec
	<version: '1.2' imports: #('1.0-baseline' )>
	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'probably ok'.
		spec author: 'WernerKassens'.
		spec timestamp: '3/18/2016 13:46'.
		spec package: 'Math-Benchmarks-RealInterval'
				with:'Math-Benchmarks-RealInterval-WernerKassens.2'.
		spec package: 'Math-Tests-RealInterval' with:'Math-Tests-RealInterval-WernerKassens.26'.
		spec package: 'Math-RealInterval'with:'Math-RealInterval-WernerKassens.124'.
		spec for: #isNoSpur do: [		
			spec package: 'Math-RealIntervalCompatibility' 				with:'Math-RealIntervalCompatibility-WernerKassens.3'].
		spec for: #isSpur do: [
			spec package:'Math-RealIntervalCompatibility' with: 				'Math-RealIntervalCompatibility-WernerKassens.4']]