mathematical functions
tan
"this operator can be extremely problematic if one boundary is very near a multiple of halfPi and correcting that would be complicated, as for example:
Float halfPi tan. -->8.165889364191922e15
of course this not surprising at all, as halfPi is only an approximation of half Pi, obviously at the lower side. but what surprised me was this:
Float halfPi successor tan. -->8.165889364191922e15
i needed to do this to get a high negative number:
Float halfPi successor successor tan. -->-3.1091764830118915e15
this happens because #cos reacts in the same way and i found this behaviour of #cos so annoying and in a way buggy (of course one can argue, that it is a simple Floating Point Error that one can get a positive almost-infinity instead of a negative almost-infinity, but i would nevertheless expect a more rational behaviour of #cos in the range of -2 Pi to 2 Pi) that i simply ignored the whole problem. well ok, it _is_ a simple Floating Point Error, but i find it somewhat annoying nevertheless"
|l u|
self isEmpty ifTrue: [ ^RealInterval new ].
self width >= Float pi ifTrue: [ ^RealInterval entire ].
l:=inf\\Float pi.
u:=sup\\Float pi.
^l=u 
	ifTrue: [l=Float halfPi 
		ifTrue: [ RealInterval entire "well halfPi is only approximately half Pi, an interval should be used" ] 
		ifFalse:  [RealInterval fromNumber: l tan] ] 
	ifFalse: [ l<u 
		ifTrue: [ (Float halfPi between: l and: u)
			ifTrue:[ l=Float halfPi 
				ifTrue: [ RealInterval inf: Float infinity negated  sup: u tan ] 
				ifFalse:[u=Float halfPi 
					ifTrue: [ RealInterval inf: l tan sup: Float infinity ] 
					ifFalse: [(RealInterval inf: l tan sup: Float infinity )union: (RealInterval inf: Float infinity negated  sup: u tan )]]]
			 ifFalse: [ RealInterval inf: l tan sup: u tan ] ] 
		ifFalse: [(Float halfPi between: u and: l)
			ifTrue: [ l=Float halfPi 
				ifTrue: [ RealInterval inf: u tan sup: Float infinity ] 
				ifFalse:[ u=Float halfPi 
					ifTrue:  [ RealInterval inf: Float infinity negated tan sup: l tan ]
					ifFalse: [ u tan hull: l tan ]]]
			ifFalse: [ (RealInterval inf: u tan sup: Float infinity )union: (RealInterval inf: Float infinity negated  sup: l tan ) ] ]]
