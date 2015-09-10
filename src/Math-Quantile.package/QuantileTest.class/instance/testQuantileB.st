tests
testQuantileB
"tests #(2 4 5 7 8 9 10 12 15 16 18)"
self assert: (self resultCollect: b method: 'modeBased')={2. 6. 9. (27/2). 18}.
self assert: (self resultCollect: b method: 'inverseCDF')= #(2 5 9 15 18).
self assert: (self resultCollect: b method: 'closestObservation')=  #(2 5 9 12 18) .
self assert: (self resultCollect: b method: 'California')= {2. (19/4). (17/2). (51/4). 18} .
self assert: (self resultCollect: b method: 'hydrologist')= {2. (11/2). 9. (57/4). 18} .
self assert: (self resultCollect: b method: 'Weibull')=  #(2 5 9 15 18).
self assert: (self resultCollect: b method: 'medianBased')=   {2. (16/3). 9. (29/2). 18}.
self assert: (self resultCollect: b method: 'normalDistribution')=   {2. (43/8). 9. (231/16). 18}.
self assert: (b quantile: (1/4))=6.
self assert: b interQuartileRange = (35/4).


