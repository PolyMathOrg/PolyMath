information
distributionValue: aFloat
"returns the probability of getting a value <= aFloat"
|i|
i:=(aFloat - b)/a.
i<=0 ifTrue:[^0].
i>=1 ifTrue:[^1].
^distribution distributionValue: (aFloat - b)/a