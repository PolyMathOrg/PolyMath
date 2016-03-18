tests - arithmetic
testMod
self assert: empty \\1=empty.
self assert: z\\4.7=z.
self assert: z\\ -1=z.
self assert: o\\(2/3)=(1/3).
self assert: o negated \\(2/3)=(1/3).
self assert: a \\(2/3)=(RealInterval inf: 0 sup: (2/3)).
self assert: b \\3.9=(RealInterval inf: 0 sup: 3.9).
self assert: c negated \\ 7 =(RealInterval inf: 0 sup: 6).
self assert: c  \\ 7 =((RealInterval inf: 1 sup: 7)union:0).
self assert: d  \\ -2=(RealInterval inf: -2 sup: 0).
e inf:(-6/5).
self assert: e \\ 1= ((RealInterval inf: 0 sup: (1/4))union: (RealInterval inf: (4/5) sup: 1)).
self assert: e negated \\ 1= ((RealInterval inf: 0 sup: (1/5))union: (RealInterval inf: (3/4) sup: 1)).
self assert: e \\ -1= ((RealInterval inf: -1 sup: (-3/4))union: (RealInterval inf: (-1/5) sup: 0)).
self assert: e negated \\ -1= ((RealInterval inf: -1 sup: (-4/5))union: (RealInterval inf: (-1/4) sup: 0)).
self assert: e negated \\ 2= e negated.
self assert: e negated \\ -2= (RealInterval inf: (-5/4) sup: (-4/5)).
self assert: e  \\ -2= (RealInterval inf: (-6/5) sup: (-3/4)).
self assert: e  \\ 2= (RealInterval inf: (4/5) sup: (5/4)).
self assert: g \\ -3=(RealInterval inf: -3 sup: 0).
self assert: (RealInterval inf: 1 sup: 4)\\4 = (0 union: (RealInterval inf: 1 sup: 4)).
self assert: (RealInterval inf: -4 sup: -1)\\ -4 = (0 union: (RealInterval inf: -4 sup: -1)).
