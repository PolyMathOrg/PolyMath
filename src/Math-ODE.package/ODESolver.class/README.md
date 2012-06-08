An ODE Solver uses a Stepper to solve a System. 

The main interface once the solver is set up (it has a stepper and a solver) is
	solve: system x0: aState t0: startTime t1: endTime
	solve: system x0: aState t0: startTime t1: endTime stepSize: dt
	
Announcements are made when a step is taken.