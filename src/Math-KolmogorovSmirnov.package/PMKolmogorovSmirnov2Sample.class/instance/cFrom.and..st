private
cFrom:i and:j 
"needs ksStatistic!"
^ (i/smallSize -(j/bigSize))abs < ksStatistic  ifTrue:[1]ifFalse:[0]
