information
normal: aNumber
		"Computes the value of the Normal distribution for aNumber
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 5/1/99 "

	^[ ( aNumber squared * -0.5) exp * norm]
			on: Error do: [ :signal | signal return: 0]