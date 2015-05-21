accessing
argument
|r|
r:=self argumentAt: self findKey.
numberOfResults ifNotNilDo: [ :rn|r:=r at:rn ].
^r.