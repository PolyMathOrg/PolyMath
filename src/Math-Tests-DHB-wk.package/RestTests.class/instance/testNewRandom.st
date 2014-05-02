tests
testNewRandom
|a |
a:=DhbSymmetricMatrix  new:7 random: 5.0 .
a:=DhbMatrix rows: a rows.
self assert: (a isSymmetric ).

