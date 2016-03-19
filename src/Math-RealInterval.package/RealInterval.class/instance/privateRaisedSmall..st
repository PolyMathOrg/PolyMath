private
privateRaisedSmall: anInt 
"self<=1"
(self isEmpty or:[anInt isEmpty ])ifTrue:[^RealInterval new].
((self=0)and:[(anInt ~=1)and: [anInt includes:  1]])ifTrue: [ ^0 union:1 ].
^RealInterval inf: (inf raisedTo: anInt sup) sup: (sup raisedTo: anInt inf)