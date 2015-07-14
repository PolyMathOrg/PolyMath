initialization
computeNorm
		"Private - Compute the norm of the receiver because its parameters have changed.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	norm := ( dof1 ln * ( dof1 / 2) ) + ( dof2 ln * ( dof2 / 2) )
						- ( ( dof1 / 2) logBeta: ( dof2 / 2) ).