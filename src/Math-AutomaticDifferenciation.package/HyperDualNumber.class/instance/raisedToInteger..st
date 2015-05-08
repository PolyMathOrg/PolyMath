mathematical functions
raisedToInteger: anInteger
|v|
anInteger=0 	ifTrue:[^self class value:1 eps:0 eps2:0 eps1eps2:0].
v := value raisedToInteger: anInteger -1.
^(super raisedToInteger: anInteger) eps2: anInteger * eps2 *  v; eps1eps2: eps1eps2 * anInteger * v +(eps * eps2 * anInteger * (anInteger -1) * (value raisedToInteger: anInteger -2));yourself
