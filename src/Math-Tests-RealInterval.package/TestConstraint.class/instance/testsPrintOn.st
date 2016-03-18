tests
testsPrintOn
|a aStream|
aStream :=ReadWriteStream with:''.
a:=Constraint new.
a printOn: aStream .
self  assert:(aStream contents='a Constraint([ :x | x ] <= 0)' ).
a min: -2.
aStream reset.
a printOn: aStream .
self  assert:(aStream contents='a Constraint(-2 <= [ :x | x ])' ).
a admissibleImage: (RealInterval inf: -2 sup: 0).
aStream reset.
a printOn: aStream .
self  assert:(aStream contents='a Constraint(-2 <= [ :x | x ] <= 0)' ).
