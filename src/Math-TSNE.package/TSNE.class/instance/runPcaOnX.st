running
runPcaOnX
	"Runs PCA on X in order to reduce its dimensionality to initialdims dimensions.

	print ""Preprocessing the data using PCA...""
	(n, d) = X.shape;
	X = X - Math.tile(Math.mean(X, 0), (n, 1));
	(l, M) = Math.linalg.eig(Math.dot(X.T, X));
	Y = Math.dot(X, M[:,0:no_dims]);
	return Y;
"

	"| analyzer i |
	analyzer := PMPrincipalComponentAnalyser new: initialdims.
	i := 1.
	x dimension x
		timesRepeat: [ analyzer accumulate: (x rowAt: i).
			i := i + 1 ].
	^ analyzer components"