initialization
initCachedUCalculation
"recursive calc, slow without memoization"
uCalcBlock:=[:iandj||cij i j|
i:=iandj first.j:=iandj second.
cij:=self cFrom: i and: j.
i*j=0 
	ifTrue:[ cij]
	ifFalse:[cij * ((uCalcBlock value:{i.j-1})+(uCalcBlock value:{i-1.j}))]]memoized.