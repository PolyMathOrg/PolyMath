running
setUp
manager:= DhbChromosomeManager new.
manager populationSize:3.
function:=[:x| (x*x)sum].
optimizer:= PMGeneticOptimizer minimizingFunction: function.
optimizer chromosomeManager: manager.