accessing
populationSize: anInteger
" if you have a lot of parameters (essentially beginning with 3 parameters), you may want to enlarge the populationsize. default is only 50. eg for 3 parameters, you might want set this to 300"
self resetResult.
manager populationSize: anInteger .
^anInteger 