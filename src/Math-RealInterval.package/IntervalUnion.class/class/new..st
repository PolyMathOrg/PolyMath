instance creation
new:aSize 
|i|
i:=super new: aSize. 
i sortBlock: self sortBlock.
^i