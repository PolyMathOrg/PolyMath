as yet unclassified
x2p
	| p d beta logU n betaMin betaMax|
	n := x numberOfRows.
	d := self computePairwiseDistances.
	p := PMMatrix zerosRows: n cols: n.
	beta := PMMatrix onesRows: n cols: 1.
	logU := self perplexity log.
	n timesRepeat: [
		betaMin := Float infinity.
		betaMax := Float infinity negated.
		
		 ]