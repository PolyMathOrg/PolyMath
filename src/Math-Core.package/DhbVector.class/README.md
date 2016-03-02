A vector is an object in a multidimensional space. It is represented by its components measured on a reference system.

Here is a typical use of myself

[[[ 
| u v w a b c |
u := #(1 2 3) asVector.
v := #(3 4 5) asVector.
a := DhbMatrix rows: #( ( 1 0 1 ) (-1 -2 3)).
b := DhbMatrix rows: #( ( 1 2 3 ) (-2 1 7) (5 6 7)).
w := 4 * u + (3 * v).
c := a * b.
v := a * u.
w := c transpose * v.
w := v * c.
]]]

(c) Copyrights Didier BESSET, 1999.