tests
testProcessand
cm reset.
1 to: 60 do:[:i| cm process: #(0 0) and:#(1 1) ].
self assert: ((cm population select: [:i|i=#(0 0)])size <15).
self assert: ((cm population select: [:i|i=#(1 1)])size <15).
self assert: ((cm population select: [:i|i=#(0 1)])size >0).
self assert: ((cm population select: [:i|i=#(1 0)])size >0).
self assert: (cm population size =120).
