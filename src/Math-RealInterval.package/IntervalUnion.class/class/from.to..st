instance creation
from: anInteger to: anotherInteger 
|i|
(anInteger isInteger and:[anotherInteger isInteger ])
	ifFalse:[^self error:'only Integers allowed'].
i:=self new: anotherInteger -anInteger +1.
i addAll:( Interval from: anInteger  to: anotherInteger).
^i  
