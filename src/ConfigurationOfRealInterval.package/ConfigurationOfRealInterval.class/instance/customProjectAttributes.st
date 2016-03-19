accessing
customProjectAttributes
|a|
a:=OrderedCollection new.
a add:((SystemVersion current major < 5 or:[Smalltalk vm isSpur not])
	ifTrue: [#isNoSpur] ifFalse: [#isSpur]).
[Gofer new 
	directory:'http://smalltalkhub.com/mc/SergeStinckwich/SciSmalltalk/main/';
	package:'Math-Tests-RealInterval-Compatibility';
	load]on: Error do:[:e|(Smalltalk hasClassNamed: 'TestOldMethods')
		ifFalse:[self warning:'RealInterval will not be loaded because TestOldMethods was not found'. ^a] ].
TestOldMethods isProblematic 
	ifFalse: [a add:#RILoadable] 
	ifTrue:[self warning:'RealInterval will not be loaded because of incompatibilities'].
^a