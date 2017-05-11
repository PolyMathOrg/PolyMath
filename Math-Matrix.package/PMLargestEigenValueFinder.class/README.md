[ [ [ 
m := PMMatrix rows: #( ( 84 -79  58 55)
						(-79  84 -55 -58)
						( 58 -55  84  79) 
						( 55 -58  79  84) ).
finder := PMLargestEigenValueFinder matrix: m.
eigenvalue := finder evaluate.
eigenvector := finder eigenvector.
nextFinder := finder nextLargestEigenValueFinder.
nextEigenvalue := nextFinder evaluate.
nextEigenvector := nextFinder eigenvector.
] ] ]