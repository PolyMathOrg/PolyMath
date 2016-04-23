initialization
initialize
	"Initialize the receiver state vector and multiplier"

	states := Array new: DefaultLengthVector.
	mti := 1.
	states at: 1 put: ( self seed bitAnd: Mt19937Mask ).
	2 to: DefaultLengthVector
		do: [ :multIndex | 
			states 
				at: multIndex 
				put: ( 16r6C078965 * 
						( ( states at: multIndex - 1 ) 
							bitXor: ( ( states at: multIndex - 1 ) bitShift: 30 negated ) ) + multIndex ).			
			states 
				at: multIndex 
				put: ( ( states at: multIndex ) bitAnd: Mt19937Mask )
      ]
