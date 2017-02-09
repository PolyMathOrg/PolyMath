creation
generateSeeds: congruentialGenerator
	"Private- "
	^self constants: ((1 to: 55) collect: [:n | congruentialGenerator floatValue])
		lowIndex: 24