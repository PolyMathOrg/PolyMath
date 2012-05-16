display
showParameters
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/6/99 "
		"added 'Transcript flush' to make sure that the transcript window gets updated"
	Transcript cr; cr;
			nextPutAll: 'Floating-point machine parameters'; cr;
			nextPutAll: '---------------------------------';cr;
			nextPutAll: 'Radix: '.
	self radix printOn: Transcript.
	Transcript cr; nextPutAll: 'Machine precision: '.
	self machinePrecision printOn: Transcript.
	Transcript cr; nextPutAll: 'Negative machine precision: '.
	self negativeMachinePrecision printOn: Transcript.
	Transcript cr; nextPutAll: 'Smallest number: '.
	self smallestNumber printOn: Transcript.
	Transcript cr; nextPutAll: 'Largest number: '.
	self largestNumber printOn: Transcript.
	Transcript flush.