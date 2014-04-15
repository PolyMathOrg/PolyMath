linear algebra
testSingularMatrixError
|h f|
h:=DhbHistogram new.
h freeExtent: true.
1 to: 3 do:  [:i| h accumulate: i ].
f:=DhbLeastSquareFit histogram: h distributionClass: DhbTriangularDistribution.
self should: [ f evaluate ] raise: SingularMatrixError .
"and not something completely incomprehensible"