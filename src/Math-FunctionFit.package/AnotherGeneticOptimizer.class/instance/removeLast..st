accessing
removeLast: aBoolean
"if steadyState is true, then either the worst individual (removeLast:true) is deleted, or the most similar to the new individual (removeLast:false) is deleted, to make room for the new one. default is false, since this keeps diversity high. But it is a bit slow"
removeLast :=aBoolean .