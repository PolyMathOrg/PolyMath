tests
testQuantileA
"tests #(1 3 2 4)"
self assert: (self resultCollect: a method: 'modeBased')= {1. (7/4). (5/2). (13/4). 4}.
self assert: (self resultCollect: a method: 'inverseCDF')=  #(1 1 2 3 4).
self assert: (self resultCollect: a method: 'closestObservation')= #(1 1 2 3 4) .
self assert: (self resultCollect: a method: 'California')= #(1 1 2 3 4) .
self assert: (self resultCollect: a method: 'hydrologist')= {1. (3/2). (5/2). (7/2). 4} .
self assert: (self resultCollect: a method: 'Weibull')= {1. (5/4). (5/2). (15/4). 4}.
self assert: (self resultCollect: a method: 'medianBased')=  {1. (17/12). (5/2). (43/12). 4}.
self assert: (self resultCollect: a method: 'normalDistribution')=  {1. (23/16). (5/2). (57/16). 4}.
self assert: (a quantile: (1/4))=(7/4).
self assert: a interQuartileRange =2.