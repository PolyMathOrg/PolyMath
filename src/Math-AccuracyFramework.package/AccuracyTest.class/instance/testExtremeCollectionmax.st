tests
testExtremeCollectionmax
|c|
c:=#(4 4 2).
	self assert: (a extremeCollection: c max: true) = {Float infinity negated}.
	self assert: (a extremeCollection: c max: false) = {Float infinity }.
	self assert: (a extremeCollection: {c} max: false) = {Float infinity .Float infinity .Float infinity .}