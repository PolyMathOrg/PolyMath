private
testGeneratorCombined
	| x y |
	30 timesRepeat: 
	[x := (50 to: 550) atRandom: self.
	y := (50 to: 550) atRandom: self.
	Transcript show: 'testX', x asString, 'testY', y asString; cr.]