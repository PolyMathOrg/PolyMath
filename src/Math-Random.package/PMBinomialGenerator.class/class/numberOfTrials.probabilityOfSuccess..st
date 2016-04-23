instance-creation
numberOfTrials: numberOfTrials probabilityOfSuccess: probabilityOfSuccess
	^ self new 
		numberOfTrials: numberOfTrials;
		probability: probabilityOfSuccess; 
		yourself