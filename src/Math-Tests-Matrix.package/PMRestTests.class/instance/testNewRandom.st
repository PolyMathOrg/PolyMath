tests
testNewRandom
|a |
a:=PMSymmetricMatrix  new:7 random: 5.0 .
a:=PMMatrix rows: a rows.
self assert: (a isSymmetric ).

