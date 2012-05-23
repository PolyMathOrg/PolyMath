Basic steppers execute one timestep of a specific order with a given stepsize.

From odeint-v2 documentation:

Solving ordinary differential equation numerically is ususally done iteratively, that is a given state of an ordinary differential equation is iterated forward x(t) -> x(t+dt) -> x(t+2dt). Steppers perform one single step. The most general stepper type is described by the Stepper concept.

Before calling doStep, it is important to associate the stepper with a system. The class method onSystem will assign the system to the Stepper.


