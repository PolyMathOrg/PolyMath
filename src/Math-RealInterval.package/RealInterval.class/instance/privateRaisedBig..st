private
privateRaisedBig: anInt 
"self>=1"
(self isEmpty or:[anInt isEmpty ])ifTrue:[^RealInterval new].
^RealInterval inf: (inf raisedTo: anInt inf) 
	sup: (anInt sup isInfinite ifTrue: [ (sup>1) ifTrue:[Float infinity]ifFalse:[1] ] ifFalse: [sup raisedTo: anInt sup])