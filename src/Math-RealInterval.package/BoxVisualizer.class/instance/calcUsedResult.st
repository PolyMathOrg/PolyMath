private
calcUsedResult
usedResult := (result first size=2 and:[dimensions =#(1 2)])
	ifTrue:[result]
	ifFalse:[result collect: [ :box|
		IntervalBox with: (box at:(dimensions first)) with: (box at:(dimensions second))]].
self calcZoomFactor .
^usedResult 
