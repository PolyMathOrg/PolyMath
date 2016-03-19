operation
finalizeIterations
|domCo|"do not use ifEmpty:etc here"
inexactResults := 0.
[initialQueue isEmpty ifTrue:[true]ifFalse:
	[(domCo :=initialQueue removeFirst) second inf <=min 
		ifTrue:[result add:domCo. inexactResults :=inexactResults +1. false]
		ifFalse:[true]]] whileFalse.
initialQueue :=nil.
^self cleanUp 