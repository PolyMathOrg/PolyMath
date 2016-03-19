private
privateRaisedToInteger: anInteger
|r r1 r2|
(anInteger=0)ifTrue: [ ^self class fromNumber: 1 ].
r1:=inf raisedToInteger: anInteger abs.
r2:= sup raisedToInteger: anInteger abs.
r1>r2 ifTrue: [ r:=r1.r1:=r2.r2:=r ].
r:= self class inf: r1 sup: r2.
(anInteger<0) ifTrue: [^ r reciprocal ].
^ r
