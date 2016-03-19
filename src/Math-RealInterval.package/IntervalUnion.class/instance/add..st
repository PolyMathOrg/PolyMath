adding
add: anInterval
anInterval isIntervalUnion
	ifTrue: [anInterval do: [:i| self add:i ]]
	ifFalse: [ anInterval isRealInterval 
			ifTrue: [ super add: anInterval ]
			ifFalse:[super add: (RealInterval fromNumber: anInterval) ]].
self reduce.
^anInterval  