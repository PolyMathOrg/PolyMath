example
example
""
|a b c d|
"This is how we can create a matrix, a and b are 2x3 matrices in
this example"
a := PMMatrix rows: #( ( 1 0 1 ) (-1 -2 3)).
b := PMMatrix rows: #( ( 1 2 3 ) (-2 1 7)).

"Matrix product"
c := a * b.

"Elementwise matrix product"
d := a dot:b.

"This is how we can create a vector"
a := #(1 4 9 16 25) asPMVector.

"Vectors and Matrices support basic logical and arithmetic
operations"
Float pi sin * d.
a sqrt.
a > 3.
c cos.
c < 0.

"It is possible to create a vector/matrix of random numbers"
a := PMVector randomSize: 10 maxNumber: 3.
b := PMMatrix rows: 2 columns: 3 random: 5.

"It is also easy to create a vector/matrix of zeros/ones"
a := PMVector ones:15.
b := PMMatrix zerosRows: 2 cols: 3.

"We can also compute the cumulative sum or regular sum the vector/
matrix as following"
a := PMMatrix rows: #( ( 1 0 1 ) (-1 -2 3)).
a cumsum.
"a PMVector(1 1 2)"
"a PMVector(-1 -3 0)"
a sum.
"a PMVector(2 0)"

"Matrix trace (sum of a diagonal elements for a square matrix)"
a := PMMatrix rows: #((1 2 3)(4 5 6)(7 8 9)).
a tr.
"15"