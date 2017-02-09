tests
testDhbHistogrammedDistribution
| g|
g:=PMHistogrammedDistribution histogram: h.
"this raised an error (and printOn: did not work) because #parameters was not defined:"
self shouldnt: [ g printString ] raise: Error.
