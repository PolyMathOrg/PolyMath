operation
finalizeIterations
myDesiredPrec :=0.
initialQueue ifNotEmpty: [ myDesiredPrec := initialQueue size. result addAll:initialQueue ].
initialQueue :=nil.
