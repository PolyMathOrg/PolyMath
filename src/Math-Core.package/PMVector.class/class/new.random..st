instance creation
new: size random: maxRandomNumber 
	"Answer an instance of me, with number of elements equal to size, each 
	a randomNumber lower than maxRandomNumber ."

	^self newFrom:  ( (1 to: size ) collect: [:e|maxRandomNumber random ]  )