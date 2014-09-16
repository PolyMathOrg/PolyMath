tests
testAccessing
self assert: (cm range=#(2 3)).
self assert: (cm populationSize=100).
self deny: (cm isFullyPopulated ).