tests - testing
testIncludes
self deny: (i includes: 0).
self deny: (i includes: z).
self deny: (i includes: x).
self assert: (i includes: empty).
self assert: (x includes: empty).
self assert: (i includes: i).
self deny: (empty includes: x).
self assert: (empty includes: i).
self deny: (x includes: -2).
self assert: (x includes: -1).
self assert: (x  includes: (-3/4)).
self deny: (x includes: -0.5).
self assert: (x includes:z).
self assert: (x includes:e).
self deny: (x includes:0.1).
self deny: (x includes:d).
self assert: (x includes: Float infinity).
self assert: (x includes: 2).
self assert: (x includes: (d+3)).
self assert: (b includes: x).
self deny: (a includes:x).
self assert: (a includes: (x difference: e)).
self assert: (x includes: x).
self assert: (x includes: (x difference: e)).
self deny: ((x difference: e) includes:x).



