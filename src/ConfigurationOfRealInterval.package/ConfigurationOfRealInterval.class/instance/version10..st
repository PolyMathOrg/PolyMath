versions
version10: spec
	<version: '1.0' imports: #('1.0-baseline' )>
	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'initial version'.
		spec author: 'WernerKassens'.
		spec timestamp: '2/6/2016 13:46'.
		spec package: 'Math-Benchmarks-RealInterval'
				with:'Math-Benchmarks-RealInterval-WernerKassens.1'.
		spec package: 'Math-Tests-RealInterval' with:'Math-Tests-RealInterval-WernerKassens.16'.
		spec package: 'Math-RealInterval'with:'Math-RealInterval-WernerKassens.104'.
		spec for: #isNoSpur do: [		
			spec package: 'Math-RealIntervalCompatibility' 				with:'Math-RealIntervalCompatibility-WernerKassens.1'].
		spec for: #isSpur do: [
			spec package:'Math-RealIntervalCompatibility' with: 				'Math-RealIntervalCompatibility-WernerKassens.2']]