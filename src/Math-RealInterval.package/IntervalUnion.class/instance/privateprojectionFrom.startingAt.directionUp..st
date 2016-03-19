private
privateprojectionFrom: aNumber startingAt: anIndex directionUp: aBoolean
|col i result|
col:= aBoolean ifTrue: [ self ] ifFalse: [ self reverse ].
i:=aBoolean ifTrue: [ anIndex ] ifFalse: [ col size + 1 - anIndex ].
i to: col size do:[:j| result:=(col at:j) projectionFrom: aNumber. result isNaN ifFalse: [ ^result ]].
^result