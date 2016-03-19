accessing
admissibleNumberForValue: aValue
"returns 0 if aValue is not admissible, 1 if it is partly admissible or undecidable and 2 if it is completely admissible"
|a i|
a:=0.
self do:[:c| 
	i:=(c admissibleNumberForValue: aValue).
	i=0 ifTrue:[^0]ifFalse:[i=2 ifTrue:[a:=a+1]]]. 
self size = a ifTrue: [ ^2 ].
^1
