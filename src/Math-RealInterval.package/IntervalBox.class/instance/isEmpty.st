testing
isEmpty 
^self size = 0 or: [self anySatisfy: [:i|i isEmpty]].
