util
quadrant:aFloat
aFloat <=Float halfPi ifTrue: [ ^1 ].
aFloat <=Float pi ifTrue: [ ^2 ].
aFloat <=(Float halfPi + Float pi) ifTrue: [ ^3 ].
^4
