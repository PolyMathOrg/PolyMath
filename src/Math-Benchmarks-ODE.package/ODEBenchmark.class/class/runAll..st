as yet unclassified
runAll:  numOfIterations 
|collection|

collection := self withAllSubclasses collect:[ :each| each run: numOfIterations ]  .
^ collection joinUsing: Character cr.