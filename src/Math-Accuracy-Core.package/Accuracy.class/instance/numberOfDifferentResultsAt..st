accessing
numberOfDifferentResultsAt: aname
|no|
no := self resultsAt: aname.
no isCollection ifFalse:[no:={no}].
^(no first) isCollection ifTrue: [ no size ] ifFalse: [ 1 ]