operation
rangeScale
"keeps constant selection pressure"
	| size best|
size:=bestPoints size -1.
best := 0.0 .
^(size to:1 by:( -1))collect: [:i|best:=2*i/(size*(size+1))+best].
