A Fixpoint is just a little utility. it calculates the fixpoint of a block with one variable. a starting value for the variable is necessary. the variable does not need to be numerical, it can be anything the block can eat and spit out.
example:
a:=Fixpoint block: [:x| 1/ (1+x )] value: 20.0.
a evaluate. 
"-->0.6180339887498948"
