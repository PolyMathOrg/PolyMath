set operations
hull
self reduce.
self isEmpty ifTrue: [ ^RealInterval new ].
^RealInterval inf: self inf sup: self sup