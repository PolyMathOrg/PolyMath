tests
testaddPointAt
| b |
go chromosomeManager populationSize: 2.
go resetBestPoints .
go addPointAt: #(0 1 0).
b:=go bestPoints.
self assert: (b first position=#(0 1 0)  ).
self assert: (b first value=1  ).
go addPointAt: {0 . Float nan.0}.
self assert: (go bestPoints=b  ).
go addPointAt: {(0-Float infinity) . 0. 0}.
self assert: (go bestPoints=b  ).
go addPointAt: #(1 1 0).
b:=go bestPoints.
self assert: (b size=2).
go addPointAt: #(2 1 0).
self assert: (go bestPoints=b  ).
go addPointAt: #(0 0.9 0).
self assert: (b first position=#(0 0.9 0)  ).
self assert: (b second position=#(0 1 0)  )."never throw away old first position"
go removeLast: true.
go addPointAt: #(0 0.89 0).
self assert: (b first position=#(0 0.89 0)  ).
self assert: (b second position=#(0 0.9 0)  ).



