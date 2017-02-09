accessing
maxFunction
	"The number of data partitions used. The highest number that can be send to #value:"

	^ function ifNil: [ 0 ] ifNotNil: [ :f | f size ]