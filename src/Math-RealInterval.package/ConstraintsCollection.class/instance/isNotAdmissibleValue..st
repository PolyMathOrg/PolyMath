testing
isNotAdmissibleValue: aValue
^self anySatisfy: [ :c| c isNotAdmissibleValue: aValue ]