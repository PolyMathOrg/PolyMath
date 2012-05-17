baselines
baseline100: spec 
        <version: '1.0-baseline'>
        
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: 'http://ss3.gemstone.com/ss/SciSmalltalk'.    
                spec 
			package: 'Math-All'.
                spec
                        group: 'default' with: #('Core');
                        group: 'Core' with: #('Math-All');
                        group: 'Tests' with: #('Math-All'). ].