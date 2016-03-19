private
privateRaisedTo: anInt 
"anInt isPositive"
|s|
(inf<1 and:[sup>1])ifTrue: [ s:=self split: 1. ^(s first privateRaisedSmall: anInt)union: (s second privateRaisedBig: anInt)  ].
^inf<1 ifTrue:[self privateRaisedSmall: anInt] ifFalse:[self privateRaisedBig: anInt]