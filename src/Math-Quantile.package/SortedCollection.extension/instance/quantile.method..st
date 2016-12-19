*Math-Quantile
quantile: aProbability method: aString
	"returns the expected quantile only, if I use my standard sortBlock."
	"the possible methods are #modeBased, #inverseCDF, #closestObservation, #California (the California Department of Public Works method), #hydrologist (Hazen's model used in hydrology), #Weibull, #medianBased', #normalDistribution (occasionaly used for q-q plots). the generally most useful methods imo are #hydrologist, #inverseCDF and #modeBased, which is used as a default in '#quantile:'"
	| a b c d p f |
	aProbability > 1 | (aProbability < 0)
		ifTrue: [ ^ DomainError signal: 'aProbability must be between 0 and 1' ].
	aString = #modeBased
		ifTrue: [ a := 1. b := -1. c := 0. d := 1 ]
		ifFalse: [ aString = #inverseCDF
			ifTrue: [ a := 0. b := 0. c := 1. d := 0 ]
			ifFalse: [ aString = #hydrologist
				ifTrue: [ a := 1/2. b := 0. c := 0. d := 1 ]
				ifFalse: [ aString = #closestObservation
					ifTrue: [ a := 1/2. b := 0. c := 0. d := 0 ]
					ifFalse: [ aString = #California
						ifTrue: [ a := 0. b := 0. c := 0.	d := 1 ]
						ifFalse: [ aString = #Weibull
							ifTrue: [ a := 0. b := 1. c := 0. d := 1 ]
							ifFalse: [ aString = #medianBased
								ifTrue: [ a := 1/3. b := 1/3. c := 0. d := 1 ]
								ifFalse: [ aString = #normalDistribution
									ifTrue: [ a := 3/8. b := 1/4. c := 0. d := 1 ]
									ifFalse: [ (aString isArray	and:[aString size>3])	
"there are still other ways to calc a quantile, that are more or less taken care of here"
										ifTrue: [a := aString at: 1."additive constant"
													b := aString at: 2."multiplicative constant"
													c := aString at: 3."additive constant for interpolation"
													d := aString at: 4]"multiplicative const for interpolation"
										ifFalse: [ self error: 'unknown method: ', aString asString ]]]]]]]]].
	p := (self size + b) * aProbability + a.
	p < 1
		ifTrue: [ p := 1 ]
		ifFalse: [ p > self size ifTrue: [ p := self size ] ].
	^ p truncated = p
		ifTrue: [ self at: p ]
		ifFalse: [ (f := self at: p floor) + (((self at: p ceiling) - f) * (p fractionPart * d + c)) ]