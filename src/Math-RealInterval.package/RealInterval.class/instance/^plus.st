arithmetic
+ anInt
(anInt isNumber and:[anInt isRealInterval not]) ifTrue: [^(self + (RealInterval inf: anInt sup: anInt)) ] .
anInt isIntervalUnion ifTrue:[^anInt adaptToNumber: self andSend: #+].
^RealInterval inf: (inf +anInt inf) sup: sup+anInt sup