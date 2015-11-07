private
makeCDFOf: aCollection intoFirst: aBoolean
"if aCollection consists of numbers, 
it returns a sorted array of (number->{cdf.aBoolean})"
|cd s result|
cd:=0.
s:=aCollection size.
result:=aCollection asBag sortedElements do:[:a| 
	cd:=a value/s+cd. 
	a value: {cd. aBoolean}].
^aBoolean 	ifTrue: [ data:=result ]
 				ifFalse:[compareWith :=result] 