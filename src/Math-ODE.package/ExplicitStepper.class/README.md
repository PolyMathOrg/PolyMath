Explicit steppers

A first specialization are the explicit steppers. Explicit means that the new state of the ode can be computed explicitly from the current state without solving implicit equations. These steppers have in common that they evaluate the system at time t such that the result of f(x,t) can be passed to the stepper. In odeint, the explicit stepper have two additional methods

do_step( sys , inout , dxdtin , t , dt )

do_step( sys , in , dxdtin , t , out , dt )

Here, the additional parameter is the value of the function f at state x and time t.