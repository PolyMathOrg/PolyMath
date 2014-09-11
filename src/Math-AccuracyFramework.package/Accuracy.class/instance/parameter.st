accessing
parameter
|r|
r:=self parameterAt: self findKey .
numberOfParameters ifNotNilDo: [ :rn|r:=r at:rn ].
^r.
