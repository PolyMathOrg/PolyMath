operation
initializeIterations
constraints enlargeToWidth: desiredPrecision *2 .
splicer:=BoxSplicing constraints: constraints.
super initializeIterations .
min := (function value: box)sup.
