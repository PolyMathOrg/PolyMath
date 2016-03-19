operation
doSplicing
(constraints  isNotAdmissibleValue:result) 
	ifTrue: [ 1 to: result size do:[:i|result at:i put:RealInterval new].^result].
left:=true.
1 to: result size do:[:i|dimension :=i. self evaluate.].
left:=false.
1 to: result size do:[:i|dimension :=i. self evaluate.].
^result