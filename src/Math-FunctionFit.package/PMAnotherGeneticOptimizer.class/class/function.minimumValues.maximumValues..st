instance creation
function: aBlock minimumValues: anArray maximumValues: anotherArray
|o m|
o:=self minimizingFunction:aBlock.
m :=PMAnotherChromosomeManager new.
m  populationSize: 50.
o chromosomeManager:m.
o maximumIterations: 170.
(anotherArray - anArray allSatisfy: [:each| each >0]) ifFalse: 
	[^DomainError signal: 'maximum values should be greater than minimum values'].
m origin: anArray.
m range: (anotherArray - anArray).
^o
