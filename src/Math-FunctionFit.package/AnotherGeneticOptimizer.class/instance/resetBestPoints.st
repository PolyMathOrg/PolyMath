operation
resetBestPoints 
"for repeated evaluating with different starting populations"
bestPoints := SortedCollection sortBlock: [ :a :b | a betterThan: b].
result :=nil.