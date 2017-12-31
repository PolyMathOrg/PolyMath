operation
initializeIterations
"cycleFlag & result1 & result2 are used, so that 2-cycles are immediately found (with correct iteration number!)"
cycleFlag :=true.
result1:=result.
result2:=result.
(results:=OrderedCollection new: maximumIterations) add: result.
