information
covarianceMatrix
	"Answer a matrix containing the covariance of the accumulated data."
	| rows n |
	n := 0.
	rows := covariance collect:
				[ :row | n := n + 1. row, ( ( ( n + 1) to: covariance size) collect: [ :m | ( covariance at: m) at: n ])].
	^PMSymmetricMatrix rows: rows