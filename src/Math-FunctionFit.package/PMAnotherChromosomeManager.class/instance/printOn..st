printing
printOn: aStream
    aStream
        nextPutAll: self class name;
        nextPutAll: '( popSize: ';print: populationSize ;
        nextPutAll: ' origin: ';print: origin ;
        nextPutAll: ' range: ';print: range ;
        nextPutAll: ' hammersley ';print: hammersley ;
        nextPutAll: ' MutRate: ';print: rateOfMutation ;
        nextPutAll: ' CORate: ';print: rateOfCrossover ;
	  nextPutAll: ' LCRate: ';print: rateOfLC ;
	  nextPutAll: ' EIRRate: ';print: rateOfEir;
	  nextPut: $) .