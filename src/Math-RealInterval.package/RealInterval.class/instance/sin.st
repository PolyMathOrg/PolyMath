mathematical functions
sin
|l u distant q1 q2|
self isEmpty ifTrue: [ ^RealInterval new ].
self width>=Float twoPi ifTrue: [ ^RealInterval inf: -1 sup: 1 ].
l:=inf//Float twoPi .
u:=sup//Float twoPi .
distant :=l~=u.
l:=inf-(l * Float twoPi ).
u:=sup-(u * Float twoPi ).
q1:=self class quadrant: l.		
q2:=self class quadrant: u.	
((q1=q2 and:[distant ])or:[(q1=1and:[q2=4])or:[q1=3 and:[q2=2] ]]	)ifTrue: [ ^RealInterval inf: -1 sup: 1 ].
((q1=1 and:[q2=1 ])or:[(q1=4and:[q2=4])or:[q1=4 and:[q2=1] ]]) ifTrue:[^RealInterval inf: inf sin sup: sup sin ].
((q1=2 and:[q2=2 ])or:[(q1=3and:[q2=3])or:[q1=2 and:[q2=3] ]]) ifTrue:[^RealInterval inf: sup sin sup: inf sin ].
((q1=1 and:[q2=2 ])or:[(q1=1and:[q2=3])or:[(q1=4 and:[q2=3])or: [q1=4 and:[q2=2]] ]]) ifTrue:[^RealInterval inf: (inf sin min: sup sin) sup: 1 ].
^RealInterval inf: -1 sup: (inf sin max: sup sin) 
