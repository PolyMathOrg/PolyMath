operation
evaluate
|min max algo|
algo:=(self class skelboeMooreVersion=1 
	ifTrue: [SkelboeMoore1]ifFalse:[SkelboeMoore2]) function: function  box: box.
maximumIterations ifNotNilDo: [ :m|algo maximumIterations: m ].
min:=algo evaluate last inf.
algo function: [:x|(function value:x)negated] .
max:=algo evaluate last inf negated.
^RealInterval inf: min sup:max  