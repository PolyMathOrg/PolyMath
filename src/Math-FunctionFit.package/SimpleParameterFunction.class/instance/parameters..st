accessing
parameters: indexableCollection
1 to: usedVars do:[:n| varArray at: n+1 put: ( indexableCollection at: n)].
^indexableCollection 
