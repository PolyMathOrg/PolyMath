tests
testStoreOn
|aStream c |
aStream :=ReadWriteStream with:''.
c:=Constraint new.
c storeOn: aStream .
self assert: aStream contents= '(Constraint block: [ :x | x ] image: (RealInterval inf: Float infinity negated sup: 0))'.