*Math-Quantile
quantile: aProbability method: aMethodName
	"returns the expected quantile only, if I use my standard sortBlock."

	"the possible methods are #modeBased, #inverseCDF, #closestObservation, #California (the California Department of Public Works method), #hydrologist (Hazen's model used in hydrology), #Weibull, #medianBased', #normalDistribution (occasionaly used for q-q plots). the generally most useful methods imo are #hydrologist, #inverseCDF and #modeBased, which is used as a default in '#quantile:'"

	| probs |
	aProbability > 1 | (aProbability < 0)
		ifTrue: [ ^ DomainError signal: 'aProbability must be between 0 and 1' ].
	probs := self perform: aMethodName.
	^ self quantile: aProbability withProbs: probs