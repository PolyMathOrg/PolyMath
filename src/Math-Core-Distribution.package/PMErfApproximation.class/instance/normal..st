information
normal: aNumber
	"Computes the value of the Normal distribution for aNumber"

	^ [ (aNumber squared * -0.5) exp * norm ]
		on: Error
		do: [ :signal | signal return: 0 ]