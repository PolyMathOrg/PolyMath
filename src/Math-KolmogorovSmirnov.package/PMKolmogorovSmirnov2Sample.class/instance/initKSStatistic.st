initialization
initKSStatistic
	| t |
	ksStatistic := 0.
	self initCachedUCalculation.	"needs to be set lately, iow here"
	smallSize := data size.
	bigSize := compareWith size.
	smallSize > bigSize
		ifFalse: [ ^ self ].
	t := smallSize.
	smallSize := bigSize.
	bigSize := t