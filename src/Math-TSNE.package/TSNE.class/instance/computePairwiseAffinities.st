as yet unclassified
computePairwiseAffinities
"
	sum_Y = np.sum(np.square(Y), 1);
		num = 1 / (1 + Math.add(Math.add(-2 * Math.dot(Y, Y.T), sum_Y).T, sum_Y));
		num[range(n), range(n)] = 0;
		Q = num / Math.sum(num);
		Q = Math.maximum(Q, 1e-12);"
		|num tmp|
	sumY :=  (x dot:x) sum. "PMVector"
	tmp := ((y* (y transpose)) * (-2)) transpose.
	num := ((PMMatrix rows: (tmp rowsCollect: [ :each| each + sumY])) ).
	
	
		
	