operation
doFastSplicing
|old i|
i:=0.
result ifNil:[self error:'Box is not initialized'].
[old:=result copy. self doSplicing.i:=i+1.i=FastMaxIterations or:[old = result]]whileFalse . 
^result