converting
reduce
|i j|
i:=1.
[[(i<=self size)and: [(self at:i)isEmpty]] whileTrue: 
	[ self removeAt: i . 
	  (i>1)ifTrue:[i:=i-1] ].
 (j:=i+1) <= self size] whileTrue:
	[ (self at:j)inf <= (self at:i)sup 
		ifTrue: [ "this complicated form _is necessary, one _has to make a new interval:"
				array at: i + firstIndex - 1 put: (RealInterval inf: (self at:i)inf sup:((self at:i)sup max: (self at:j)sup)).
				self removeAt: j ] 
		ifFalse: [ i:=i+1 ]  ].

