versions
version11: spec
	<version: '1.1' imports: #('1.0-baseline' )>
	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'exclusively for development. loads the latest versions of packages apart from Math-RealIntervalCompatibility which needs to stay fixed. essentially works like the usual baseline load (most packages are intentionally not specified, which makes it work like a baseline)'.
		spec author: 'WernerKassens'.
		spec timestamp: '2/7/2016 13:46'.
		spec project: 'SciST' with: [spec versionString: #'development'].
		spec for: #isNoSpur do: [		
			spec package: 'Math-RealIntervalCompatibility' 					with:'Math-RealIntervalCompatibility-WernerKassens.3'].
		spec for: #isSpur do: [
			spec package:'Math-RealIntervalCompatibility' 
					with:'Math-RealIntervalCompatibility-WernerKassens.4']]