tests
testSmall
|kd|
kd:=KolmogorovsDistribution exampleSize: 10.
self assert:((kd average round:2) =(0.25916round:2)).
self assert:((kd standardDeviation round:3)=(0.079832round:3)). 
self assert:((kd skewness round:2)  =(0.8180 round:2)). 
self assert:((kd kurtosis round:2)  =(3.697 round:2)). 
self assert:(((kd distributionValue: 0.1512) round:3) = 0.05). 
self assert:(((kd distributionValue: 0.4103) round:3) = 0.95). 
self assert: (kd parameters = #(10)). 
