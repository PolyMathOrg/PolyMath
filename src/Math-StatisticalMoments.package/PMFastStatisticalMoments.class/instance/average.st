information
average
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/6/99 "

	self count = 0 ifTrue: [^nil].
	^(moments at: 2) / self count