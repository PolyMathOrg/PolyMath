example
demo
	| solver system recorder |

	solver := RK4Solver new.
	system := ExplicitSystem block: [:x :t | x collect: [:i | t]]. "exact solution x = 0.5 * t squared + x0"

	recorder := self forSolver:  solver.
	"an example of moving backward in time with fractional dt"
	solver solve: system  startState: #(3 1) startTime: 2 endTime: 0  stepSize: (-1 / 10).

	recorder unsubscribe.
	
	"these wont be captured. an example of moving forward in time with float dt."
	solver solve: system  startState: #(0) startTime: 0 endTime: 5 stepSize: 0.1.
	
	recorder states  inspect.