accessing
defaultBlock
	"this is the default transcript output"
	^  [:ann | Transcript show: 'state: ';
					show: ann x asString ;
					tab; tab;
					show: ' time: ';
					show: ann t asString; 
					cr ].
