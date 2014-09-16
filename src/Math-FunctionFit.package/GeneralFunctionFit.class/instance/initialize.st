initialization
initialize
super initialize .
errorFunction :=ErrorOfParameterFunction new.
manager :=AnotherChromosomeManager new.
manager populationSize: 50.
go :=AnotherGeneticOptimizer minimizingFunction: errorFunction .
go chromosomeManager: manager.
go maximumIterations: 170.
self errorType: #squared.
verbose:=false.	
dataTruncated :=false.