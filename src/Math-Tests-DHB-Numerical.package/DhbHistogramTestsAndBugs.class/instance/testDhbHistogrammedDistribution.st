tests
testDhbHistogrammedDistribution
| g|
g:=DhbHistogrammedDistribution histogram: h.
"this raised an error (and printOn: did not work) because #parameters was not defined:"
self shouldnt: [ g printString ] raise: Error.
