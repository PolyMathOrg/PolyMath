accessing
argument: anArgument
arguments at: self findKey put: (anArgument ifNil: [ nil ] ifNotNilDo: [:a| self asArray: a]).
^anArgument 
