*Math-DHB-Numerical
productWithMatrix: aMatrix
^aMatrix class rows: (aMatrix rowsCollect: [:r| self productWithVector: r])