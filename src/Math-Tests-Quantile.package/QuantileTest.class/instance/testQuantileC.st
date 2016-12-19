tests
testQuantileC
"tests #(1 3 2 4 5)"
|r|
self assert: (self resultCollect: c method: #modeBased)=  #(1 2 3 4 5).
self assert: (self resultCollect: c method: #inverseCDF)=   #(1 2 3 4 5).
self assert: (self resultCollect: c method: #closestObservation)= #(1 1 3 4 5).
self assert: (self resultCollect: c method: #California)=  {1. (5/4). (5/2). (15/4). 5}.
self assert: (self resultCollect: c method: #hydrologist)=  {1. (7/4). 3. (17/4). 5}.
self assert: (self resultCollect: c method: #Weibull)= {1. (3/2). 3. (9/2). 5}.
self assert: (self resultCollect: c method: #medianBased)= {1. (5/3). 3. (13/3). 5}.
r:={1. (27/16). 3. (69/16). 5}.
self assert: (self resultCollect: c method: #normalDistribution)= r.
self assert: (self resultCollect: c method: {(3/8).(1/4). 0. 1})= r.
self assert: c interQuartileRange =(5/2).
