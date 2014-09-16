accessing
changeParametersBy: aVector
2 to: (usedVars+1) do:[:n| varArray at: n put: ((varArray at: n)+ ( aVector at: n-1)).]
