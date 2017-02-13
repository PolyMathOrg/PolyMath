initialization
initializeVarArray: aStart
varArray :=Array new: usedVars  withAll: 0.937.
(1 + aStart) to: (usedVars min: (aStart +4)) do:[:i| varArray at: i put: ( #(0.929 0.919 0.911 0.907) at: (i - aStart ) )].