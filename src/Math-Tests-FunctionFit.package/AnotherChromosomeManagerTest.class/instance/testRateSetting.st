tests
testRateSetting
self should: [cm rateOfLC: 1.3] raise:  DomainError .
self should: [cm rateOfEir: -0.3] raise:  DomainError .
self should: [cm rateOfMutation:  1.0000003] raise:  DomainError .
self should: [cm rateOfCrossover:  -0.0000003] raise:  DomainError .
self shouldnt: [cm rateOfLC: 0] raise:  Error .
self should: [cm rateOfLC: 0.33] raise:  Warning  .
cm rateOfLC: 0.2.
self shouldnt: [cm rateOfEir: 0.25] raise:  Error  .
self should: [cm rateOfEir: 0.26] raise:  Warning    .
self should: [cm rateOfMutation: 1] raise:  Warning .
"usual floating point inaccuracies should be accepted:"
self shouldnt: [cm rateOfCrossover:  0.15000000000000001 ] raise:  Warning .
self should: [cm rateOfCrossover:  0.1500001] raise:  Warning .
