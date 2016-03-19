private
privateCutPoint
"only for IntervalUnions that consist of at least two RealIntervals"
|i|
i:= self size//2.
^(self at:i) sup + (self at:(i+1)) inf /2.0