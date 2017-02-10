accessing
numberOfDifferentParametersAt: aname
"parameters have to be in a collection, even a single parameter.
never returns 0"
|no|
no := parameters at: aname  ifAbsent: [parameters at: 'AllTheRest' ifAbsent: [^1]].
no isCollection ifFalse: [^1].
^no size max: 1