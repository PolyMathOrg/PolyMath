operation
randomizePopulation
hammersley ifFalse: [^super randomizePopulation ].
population :=self class numberOfHamersleyPoints: populationSize  dimension: origin size randomized: true.
population := population collect: [:aChr| aChr *range +origin ]