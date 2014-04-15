tests
testCountsBetween
self assert: ((h countsBetween: 2 and: 4)=2).
"here is a bug in the original method: h countsBetween: 2 and: 3 resulted in -50"
self assert: ((h countsBetween: 2 and: 3)=1).
self assert: ((h countsBetween: 1 and: 3)=2).
self assert: ((h countsBetween: 2 and: 4)=2).
self assert: ((h countsBetween: 1 and: 4)=3).
self assert: ((h countsBetween: 2.1 and: 2.2)=0).
self assert: ((h countsBetween: 2 and: 2.04)=1).			"binWidth is 0.04"
self assert: ((h countsBetween: 2 and: 2.01)closeTo:0.25).	"hence this the correct result"
self assert: ((h countsBetween: 2.01 and: 3)closeTo: 0.75)."and so on..."
self assert: ((h countsBetween: 1.01 and: 2.01)closeTo:1).
self assert: ((h countsBetween: 2.01 and: 2.02)closeTo:0.25).