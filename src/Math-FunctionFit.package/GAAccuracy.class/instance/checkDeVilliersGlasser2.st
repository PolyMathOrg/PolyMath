tests
checkDeVilliersGlasser2
|ti yi g origin range optimizer  |
ti:=[:x| x -1/10 ] .
yi:=[:i| 53.81 * (1.27 raisedTo: (ti value: i)) * (3.012 *(ti value: i)+ (2.13 *(ti value: i) )sin ) tanh *(0.507 exp * (ti value: i))cos].
g :=[:x| |xc| xc:=x collect: [:i|i<0 ifTrue: [i negated ] ifFalse: [i]].
    ( (1 to: 24)collect: [:i| 
        (((xc at:2)raisedTo: (ti value: i))* (xc at:1)*( (xc at:3)*(ti value: i) + ((xc at:4)*(ti value: i))sin )tanh * ( (xc at:5)exp *(ti value: i))cos - (yi value: i))squared ])sum ].
origin:= #(0 0 0 0 0).
range:= #(60 60 60 60 60).
optimizer:= AnotherGeneticOptimizer function: g minimumValues: origin maximumValues: range. 
optimizer chromosomeManager populationSize: 600.
fast ifFalse: [optimizer maximumIterations: 350].
self  setManager: optimizer chromosomeManager with: self parameter.
^g value: optimizer evaluate
