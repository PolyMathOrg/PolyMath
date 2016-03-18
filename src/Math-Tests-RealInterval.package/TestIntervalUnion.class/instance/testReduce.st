tests - converting
testReduce
x addLast: c.
x addLast: o.
x addLast: z.
x addLast: o.
x addLast: o.
x addLast: z.
x addLast: c.
x addLast: c.
x reSort .
x reduce.
self assert: x size=3.
self assert: (x at:3)=(RealInterval inf: 1 sup: Float infinity) .
self assert: i isEmpty .
i addLast: empty.
i addLast: empty.
i addLast: c.
i addLast: empty.
i addLast: empty.
i reSort .
i reduce.
self assert: i size=1.
self assert: (i at:1)=c .
i:=IntervalUnion new.
i addLast: empty.
i addLast: empty.
i addLast: z.
i addLast: empty.
i addLast: empty.
i addLast: z.
i addLast: empty.
i addLast: empty.
i addLast: o.
i addLast: empty.
i addLast: empty.
i addLast: o.
i addLast: empty.
i addLast: empty.
i addLast: o.
i reduce.
self assert: i =(IntervalUnion with: o with:z).
x sup: -1 . 
x strongReduce .
self assert:x=(RealInterval inf: (-5/4) sup: -1).
self assert: x isRealInterval . 