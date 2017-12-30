linear algebra
testSingularMatrixError
|h f|
h:=PMHistogram new.
h freeExtent: true.
1 to: 3 do:  [:i| h accumulate: i ].
f:=PMLeastSquareFit histogram: h distributionClass: PMTriangularDistribution.
self should: [ f evaluate ] raise: PMSingularMatrixError .
"and not something completely incomprehensible"
"also here:"
self should: [ f errorMatrix ] raise: PMSingularMatrixError .
self should: [(PMMatrix rows: #((1 2 3)(3 4 6)))inverse] raise: PMSingularMatrixError .
self should: [(PMSymmetricMatrix rows: #((1 2 3)(2 2 2)(3 2 1)))inversePureLUP] raise: PMSingularMatrixError.
self should: [(PMSymmetricMatrix rows: #((1 2 3)(2 2 2)(3 2 1)))inversePureCRL] raise: PMSingularMatrixError.