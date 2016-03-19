set operations
hull: anIntervalBox
^self with: anIntervalBox collect:[:i :j|(i union: j) hull]