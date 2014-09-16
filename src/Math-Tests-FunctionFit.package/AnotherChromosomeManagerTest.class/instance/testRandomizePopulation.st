tests
testRandomizePopulation
|g|
self setHammersleyTest: true.
g :=cm population first.
self setHammersleyTest: false.
self deny: (cm population first =g).
g :=cm population first.
self setHammersleyTest: false.
self deny: (cm population first =g).
