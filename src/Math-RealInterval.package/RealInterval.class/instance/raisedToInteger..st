mathematical functions
raisedToInteger: anInteger
|i r|
self isEmpty ifTrue: [ ^RealInterval new ].
anInteger isIntervalUnion ifTrue:[^anInteger adaptToNumber: self andSend: #raisedToInteger:].
i:=anInteger isRealInterval 
	ifFalse: [anInteger ]
	ifTrue:[ anInteger isEmpty ifTrue: [ ^RealInterval new] .
			anInteger asNumber].
i isInteger ifFalse:[self error: i asString,' is no Integer'].
(i=0)ifTrue: [ ^RealInterval fromNumber: 1 ].
self isZeroInterval ifTrue: [ ^RealInterval fromNumber: 0 ].
^self isMixed 
	ifTrue:[ r:=self splitAtZero .
			(r first privateRaisedToInteger:i)union: (r second privateRaisedToInteger:i)]
	ifFalse: [ self privateRaisedToInteger: i ].
