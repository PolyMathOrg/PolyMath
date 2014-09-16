operation
processRandomParents: aNumberArray
"puts the better chromosome at the first place (is eg necessary for lineCrossOver:and:)"
	|pos1 pos2 c|
	pos1:=self randomIndex: aNumberArray.
	pos2:=self randomIndex: aNumberArray.
	pos1>pos2 ifTrue:[c:=pos1.pos1:=pos2. pos2:=c].
	chromosomeManager process: ( bestPoints at: pos1) position
						and:  ( bestPoints at: pos2) position.