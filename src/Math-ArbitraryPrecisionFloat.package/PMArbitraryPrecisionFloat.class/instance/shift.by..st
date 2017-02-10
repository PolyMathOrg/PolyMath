private
shift: m by: d
	"shift mantissa m absolute value by some d bits, then restore sign"
	
	^m negative
		ifTrue: [(m negated bitShift: d) negated]
		ifFalse: [m bitShift: d]