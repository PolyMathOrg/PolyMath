private
findKey
|s m|
s:=thisContext sender.
m :=s sender method selector .
^(names detect: [:n| m asString endsWith: n] ifNone: [nil]) ifNil: [m='initialize' 
	ifTrue: ['AllTheRest'] 
	ifFalse:[m:=s method selector asString. self error: m,' called in wrong context'] ]