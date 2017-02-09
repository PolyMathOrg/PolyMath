This class offers Gaussian elimination.

[[[ 
 (DhbLinearEquationSystem equations: #( (3 2 4)
                                   (2 -5 -1)
                                   (1 -2 2))
                      constant: #(16 6 10)
     ) solution.
]]]

Note that Gaussian elimination is solely dedicated to solving systems of linear equations. The algorithm is somewhat slower than LUP decomposition.

If the system does not have a solution --- that is, if the system's matrix is singular --- an arithmetic error occurs in the
method ==pivotAt:== when the division with the zero pivot is performed. The method ==solutionAt:== traps this error within an
exception handling structure and sets the solution vector to a special value --- the integer 0 --- as a flag to prevent attempting Gaussian elimination a second time. Then, the value ==nil== is returned to represent the non-existent solution.