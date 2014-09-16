tests
testcalcStatistics
|s|
go evaluate .
self assert: (go bestValueHistory isEmpty  ).
self assert: (go worstValueHistory isEmpty).
self assert: (go whateverHistory isEmpty).
go calcStatistics: true.
go evaluate .
s:=go iterations.
self assert: (go bestValueHistory size = s ).
self assert: (go worstValueHistory size=s).
self assert: (go whateverHistory size=s).
