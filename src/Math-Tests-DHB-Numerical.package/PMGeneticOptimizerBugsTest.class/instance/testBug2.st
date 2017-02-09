tests
testBug2
| r |
optimizer addPointAt: #(2 3).
"i add a nan by hand here,which in a way doesnt make sense, just to get a nan result for function, but with a more complicated function it is perfectly possible for the optimizer to produce nan's by itself!"
optimizer addPointAt: {Float nan. 3}.
"if you inspect r here you will see that a _single nan result can _completely throw off the ga calculations"
r:=optimizer randomScale.
self deny: r first isNaN.