streaming
streamDeviationsOfResult: aResult inCollection: aCollection tree: aTree
|sd| 
self format: (self calcDeviations: aResult in: aCollection max: true) type:'+dev' postfix:'%'tree: aTree.
(self format: (self calcDeviations: aResult in: aCollection max: false) type: '-dev' postfix:'%'tree: aTree) cr.
sd:=aCollection first isCollection 
	ifTrue: [(1 to: aCollection first size)collect:[:k| (aCollection collect:[:j| j at: k ])stdev ]. ] 
	ifFalse:[aCollection stdev] .
(self format:  sd type: 'standard deviation' postfix:nil tree: aTree) cr.