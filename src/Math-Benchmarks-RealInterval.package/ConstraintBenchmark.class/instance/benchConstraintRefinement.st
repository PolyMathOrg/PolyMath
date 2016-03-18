benchmarking
benchConstraintRefinement
|cr|
cr:=ConstraintRefinement constraints: c box: (IntervalBox  with: (RealInterval inf: -3 sup: 3) with: (RealInterval inf: -3 sup: 3) ).
cr desiredPrecision: 0.3.
cr fast: true.
cr evaluate.
