baselines
baseline01: spec 
        <version: '0.1-baseline'>
        
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: 'http://www.smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main'.    
                spec 
			package: 'Math-All'.
                spec
                        group: 'default' with: #('Core');
                        group: 'Core' with: #('Math-All');
                        group: 'Tests' with: #('Math-All'). ].