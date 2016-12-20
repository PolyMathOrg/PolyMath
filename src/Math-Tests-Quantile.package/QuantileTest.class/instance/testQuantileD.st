tests
testQuantileD
"tests #(1 3 2 4 5 6)"
self assert: (self resultCollect: d method: #modeBased)= {1. (9/4). (7/2). (19/4). 6}.
self assert: (self resultCollect: d method: #inverseCDF)=  #(1 2 3 5 6).
self assert: (self resultCollect: d method: #closestObservation)=  #(1 2 3 5 6).
self assert: (self resultCollect: d method: #california)=  {1. (3/2). 3. (9/2). 6}.
self assert: (self resultCollect: d method: #hydrologist)=  {1. 2. (7/2). 5. 6}.
self assert: (self resultCollect: d method: #weibull)= {1. (7/4). (7/2). (21/4). 6}.
self assert: (self resultCollect: d method: #medianBased)= {1. (23/12). (7/2). (61/12). 6}.
self assert: (self resultCollect: d method: #normalDistribution)=  {1. (31/16). (7/2). (81/16). 6}.
self assert: d interQuartileRange =3.
