accessing
data: aCollection
distribution := KolmogorovsDistribution exampleSize: aCollection size.
^data := aCollection asSortedCollection .