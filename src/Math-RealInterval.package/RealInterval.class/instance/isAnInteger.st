testing
isAnInteger 
"can not be named isInteger because of implementation of #= in Integer, but this check is necessary nevertheless. could be corrected with a little workaround; am just too lazy at the moment"
|i|
i:=self asNumber .
^i isInfinite not and: [i \\ 1= 0]