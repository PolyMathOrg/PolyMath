tests
testProductWithVector
| v c |
c := (1 + 1 i).
v := DhbVector new: 1.
v at: 1 put: 1.
self should: [(v * c at: 1) = c].
self should: [((c * v) at: 1) = c ].

