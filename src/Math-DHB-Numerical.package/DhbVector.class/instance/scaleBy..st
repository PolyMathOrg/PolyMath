transformation
scaleBy: aNumber
	"Modify the receiver elements by a multiplicating factor."
	1 to: self size do: [ :n | self at: n put: ((self at: n) * aNumber)].