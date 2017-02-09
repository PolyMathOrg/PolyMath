linear algebra
testSingularMatrixError
|h f|
h:=PMHistogram new.
h freeExtent: true.
1 to: 3 do:  [:i| h accumulate: i ].
f:=PMLeastSquareFit histogram: h distributionClass: PMTriangularDistribution.
self should: [ f evaluate ] raise: SingularMatrixError .
"and not something completely incomprehensible"
"also here:"
self should: [ f errorMatrix ] raise: SingularMatrixError .
self should: [(PMMatrix rows: #((1 2 3)(3 4 6)))inverse] raise: SingularMatrixError .
self should: [(PMSymmetricMatrix rows: #((1 2 3)(2 2 2)(3 2 1)))inversePureLUP] raise: SingularMatrixError.
self should: [(PMSymmetricMatrix rows: #((1 2 3)(2 2 2)(3 2 1)))inversePureCRL] raise: SingularMatrixError.