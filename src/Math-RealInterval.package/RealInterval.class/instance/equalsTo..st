comparing
equalsTo: anIntervall 
anIntervall isRealInterval ifFalse:[^self adaptToNumber: anIntervall andSend: #equalsTo: ].
^((inf=anIntervall inf)or: [inf equalsTo: anIntervall inf]) and:[(sup=anIntervall sup)or: [sup equalsTo: anIntervall sup]]