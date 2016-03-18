tests - testing
testIncludes
self deny: (empty includes: 0).
self deny: (empty includes: Float nan).
self deny: (a includes: -0.1).
self deny: (c includes: 8).
self deny: (a negated  includes: 1).
self assert: (a includes:0).
self assert: (a includes:0.1).
self assert: (a includes: Float infinity).
self assert: (b includes: (-13/7)).

self deny: (empty includes: c).
self assert: (empty includes:empty).
self assert: (a includes:empty).
self deny: (a  includes: b).
self assert: (b includes:b).
self assert: (a includes:z).
self assert: (d includes:o).
self deny: (c includes: d).
self assert: (d includes:c).
self deny: (e includes: d).
self deny: (d includes: e).
self assert: (d inflate includes:d).
self deny: (d includes: d inflate ).
self assert: (a inflate includes:a).
self deny: (a includes: a inflate ).


