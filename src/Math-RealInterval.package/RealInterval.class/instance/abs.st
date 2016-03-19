arithmetic
abs
|i s|
i:=(inf <=0) ifTrue:[self class inf: inf sup: (sup min: 0)] ifFalse:[RealInterval new].
s:=(sup>=0) ifTrue:[self class inf: (inf max:0) sup: sup] ifFalse:[RealInterval new].
^i negated union:s