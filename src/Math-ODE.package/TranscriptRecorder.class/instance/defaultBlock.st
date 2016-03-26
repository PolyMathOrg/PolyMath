accessing
defaultBlock
	"this is the default transcript output"
	^  [:ann | Transcript show: 'state: ';
					show: ann state asString ;
					tab; tab;
					show: ' time: ';
					show: ann time asString; 
					cr ]
