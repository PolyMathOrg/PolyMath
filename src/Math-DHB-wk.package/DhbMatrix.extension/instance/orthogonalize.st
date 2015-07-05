*Math-DHB-wk
orthogonalize
	"returns an orthonormal basis of column (!) vectors for a matrix of column vectors"
	^ self qrFactorizationWithPivoting first
