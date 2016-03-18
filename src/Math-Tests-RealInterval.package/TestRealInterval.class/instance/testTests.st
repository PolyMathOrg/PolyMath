tests - testing
testTests
self assert: (a isRealInterval ).
self assert: (empty isRealInterval ).
self deny: (z isZero). "necessary"
self assert: (z isZeroInterval )."replacement"
self deny: (a isZeroInterval).
self deny: (empty isZeroInterval).
self assert: (a positive ).
self assert: (c positive ).
self deny: (z positive ).
self deny: (empty positive ).
self deny: (e positive).
self deny: (a negated  positive).
self deny: (c isNumber ).
self deny: (empty isNumber ).
self assert: (z isNumber ).
self assert: (a negated negative ).
self assert: (e negative).
self deny: (c negative ).
self deny: (o negative ).
self deny: (empty  negative ).
self deny: (z negative).
self deny: (z isMixed  ).
self deny: (empty isMixed  ).
self deny: (a isMixed  ).
self assert: (b isMixed  ).
self assert: (d isMixed  ).
self assert: (d isFinite  ).
self deny:  (g isFinite  ).
self deny:  (empty isFinite  ).
self deny:  (h isFinite  ).
self deny:  (b isFinite  ).
self deny:  (g isEmpty  ).
self deny:  (z isEmpty  ).
self deny:  (o isEmpty  ).
self deny:  (b isEmpty  ).
self deny:  (c isEmpty  ).
self assert:   (empty isEmpty  ).
self assert: (g isInfinite  ).
self deny:  (d isInfinite  ).
self deny:  (empty isInfinite  ).





