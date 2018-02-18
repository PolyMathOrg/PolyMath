[[[ 
| m jacobi eigenvalues eigenvectors |
m := PMSymmetricMatrix rows: #((84 -79 58 55)
                                 (-79 84 -55 -58)
                                 (58 -55 84 79)
                                 (55 -58 79 84)).
jacobi := DhbJacobiTransformation matrix: m.
eigenvalues := jacobi evaluate.
eigenvectors := jacobi transform columnsCollect: [ :each | each].
]]]