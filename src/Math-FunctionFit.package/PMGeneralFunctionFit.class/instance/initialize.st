initialization
initialize
super initialize .
errorFunction :=PMErrorOfParameterFunction new.
manager :=PMAnotherChromosomeManager new.
manager populationSize: 50.
go :=PMAnotherGeneticOptimizer minimizingFunction: errorFunction .
go chromosomeManager: manager.
go maximumIterations: 170.
self errorType: #squared.
verbose:=false.	
dataTruncated :=false.