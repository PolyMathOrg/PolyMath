testing
isAdmissibleValue: aValue
^self allSatisfy: [ :c| c isAdmissibleValue: aValue ]