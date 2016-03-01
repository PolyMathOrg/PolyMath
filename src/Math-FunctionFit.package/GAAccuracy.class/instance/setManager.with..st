running
setManager:aManager with: rates
	"set everything to zero first, so that you dont get warnings"
	aManager 
		rateOfMutation: 0; 
		rateOfCrossover: 0; 
		rateOfLC: 0;
		rateOfEir: 0;
		rateOfMutation: rates first; 
		rateOfCrossover: (rates at:2); 
		rateOfLC: (rates at:3);
		rateOfEir: (rates at:4). 