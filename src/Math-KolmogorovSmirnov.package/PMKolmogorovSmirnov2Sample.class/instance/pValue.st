accessing
pValue
"uses procedure explained in:
Kim, P. J. & Jennrich, R. I. 
'Tables of the exact sampling distribution of the two-sample Kolmogorov–Smirnov criterion...'
in 'Selected Tables in Mathematical Statistics Volume I' (1973)."
ksStatistic ifNil: [self ksStatistic ].
^ (uCalcBlock value: {smallSize.bigSize})/ ((smallSize + bigSize) take:smallSize)  