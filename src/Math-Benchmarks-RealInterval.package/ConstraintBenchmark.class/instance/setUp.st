running
setUp 
|f |
f:=[:x|(x at:1)squared/(x at:2) +(x at:2) squared ].
c:=Constraint block: f.
c admissibleImage: (RealInterval inf: 0.5 sup:2) .
