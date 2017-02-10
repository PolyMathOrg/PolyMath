benchmarking
run: nIterations with: aSequentalCollectionClass
|b|
(b:=self new) collType: aSequentalCollectionClass .
^self defaultRunner execute: b with: nIterations. 