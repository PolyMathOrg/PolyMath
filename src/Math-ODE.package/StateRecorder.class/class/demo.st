example
demo
| solver system recorder |

solver := ODESolver new.
system := ExplicitSystem block: [:x :t | t].
recorder := self forSolver:  solver.
solver solve: system  startState: 0 startTime: 0 endTime: 2  stepSize: 0.1.

recorder unsubscribe.
"these wont be captured"
solver solve: system  startState: 0 startTime: 0 endTime: 5 stepSize: 0.1.
recorder states  inspect.