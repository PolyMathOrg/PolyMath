accessing
cycle
|length|
length:=self cycleLength ifNil:[^#()].
^(results copyFrom: results size +1 - length to: results size)asArray 
