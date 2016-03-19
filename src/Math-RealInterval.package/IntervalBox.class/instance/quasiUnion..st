set operations
quasiUnion: anIntervalBox
"is something between a union and a hull, is necessary for skelboemoore, but a real union: would be better instead, but then the output would become very complicated occasionally! ill keep it like that for the moment, as one can shut off the simplification in skelboemoore by setting useSloppySimplification to false"
"i also noticed that one occasionaly wants to use #includes: and the normal set operations. perhaps should be implemented"
^self with: anIntervalBox collect:[:ivl1 :ivl2| ivl1 union: ivl2 ] 
