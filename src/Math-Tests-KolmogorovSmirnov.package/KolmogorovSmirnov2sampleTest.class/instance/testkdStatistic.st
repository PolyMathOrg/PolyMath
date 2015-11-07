tests
testkdStatistic
"extreme case"
| d1 |
d1:=#(20.30 22.53 25.70 13.23 29.67 24.46 26.07 19.35 17.813 16.00 15.30 32.90).
k data:d1.
k otherData:d1.
self assert: (k ksStatistic =0).