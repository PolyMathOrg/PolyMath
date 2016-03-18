running
setUp
	|f1 i c1 box f |
	super setUp.
	f:=[:x|((x at:1)squared + 1)log - (x at:2)].
	f1:=[:x|((x at:1)squared + 1)squared + (x at:2)squared].
	c1:=Constraint block: f1.
	c1 equalToNumber: 4.
	i:= -4 hull:4.
	box :=IntervalBox with: i with:i.
	cm:=ConstraintsMinimizer1 function: f box: box constraints: {c1}.
	cm maximumIterations: 600.