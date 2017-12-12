accessing
data: aCollection
distribution := PMKolmogorovsDistribution exampleSize: aCollection size.
^data := aCollection asSortedCollection .