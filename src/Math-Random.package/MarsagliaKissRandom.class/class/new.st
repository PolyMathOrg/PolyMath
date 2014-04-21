instance creation
new
	| seedGenerator |
	seedGenerator := MarsagliaKissRandomKernel new.
	^self seed: (seedGenerator next: 8)