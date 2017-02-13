accessing
epanechnikov
kernelName:= 'epanechnikov'.
ikernel:=[:x|x < 5 sqrt negated  ifTrue:[0]ifFalse:[x > 5 sqrt ifTrue:[1]ifFalse:[(x - ((x raisedToInteger: 3) / 15)) * (3/(4* 5 sqrt))+(1/2)]]].
^kernel := [:x|x abs >= 5 sqrt ifTrue:[0]ifFalse: [1 - (x squared /5) * (3/(4* 5 sqrt))]].
