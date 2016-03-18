tests
testBasic
|c cr aStream|
cr:=ConstraintRefinement new.
aStream :=ReadWriteStream with:''.
cr printOn: aStream .
self assert: (aStream contents= 'a ConstraintRefinement(box: nil constraints: a ConstraintsCollection())').
(c:=Constraint block: 0) equalToNumber:  0. 
cr addConstraint: c.
self assert: cr constraints first=c.
self assert: cr constraints class=ConstraintsCollection.