operation
doRepeatedSplicing
|old|
result ifNil:[self error:'Box is not initialized'].
[old:=result copy. self doSplicing. old = result]whileFalse. 
^result