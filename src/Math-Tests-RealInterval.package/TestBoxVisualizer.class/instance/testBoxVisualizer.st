tests
testBoxVisualizer
"only tests, whether no errors occur and shows picture for a moment"
| box v x |
box:=IntervalBox  with: (RealInterval inf: -30 sup: 30) with: (RealInterval inf: -10 sup: 30) .
v:=BoxVisualizer result: (Array with:box).
v dimensions: #(2 1).
v dimensions .
v color: Color red.
v withBorder: true.
v backgroundColor: Color lightGray.
x:=v show: 'Title' .
[300 milliSeconds wait.
x delete.] fork.
self assert: v result size=1.
self assert: v result first= (box swap: 1 with: 2).
self assert: v view class=RTView.