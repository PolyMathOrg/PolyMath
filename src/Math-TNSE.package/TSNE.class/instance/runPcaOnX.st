running
runPcaOnX

"Runs PCA on the NxD array X in order to reduce its dimensionality to no_dims dimensions.

	print ""Preprocessing the data using PCA...""
	(n, d) = X.shape;
	X = X - Math.tile(Math.mean(X, 0), (n, 1));
	(l, M) = Math.linalg.eig(Math.dot(X.T, X));
	Y = Math.dot(X, M[:,0:no_dims]);
	return Y;
"