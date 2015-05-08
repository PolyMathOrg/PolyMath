comparing
equalsTo: aHyperDualNumber
^(super equalsTo: aHyperDualNumber)and:
[(eps2 equalsTo: aHyperDualNumber eps2)and: [eps1eps2 equalsTo: aHyperDualNumber eps1eps2]]