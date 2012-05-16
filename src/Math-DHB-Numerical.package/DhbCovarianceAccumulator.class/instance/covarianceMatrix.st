information
covarianceMatrix
		"Answer a matrix containing the covariance of the accumulated data.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/3/99 "
	| rows n |
	n := 0.
	rows := covariance collect:
				[ :row | n := n + 1. row, ( ( ( n + 1) to: covariance size) collect: [ :m | ( covariance at: m) at: n ])].
	^DhbSymmetricMatrix rows: rows