running
setUp 
|origin f|
f:=[:x| |v| v:=x asPMVector . v*v].
origin:= #(-5 -5 -5).
go:= AnotherGeneticOptimizer function: f minimumValues: origin maximumValues: origin negated .
go maximumIterations: 50.
go chromosomeManager populationSize: 20.