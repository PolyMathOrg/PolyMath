Symplectic solvers

As mentioned above symplectic solvers are used for Hamiltonian systems. Symplectic solvers conserve the phase space volume exactly and if the Hamiltonian system is energy conservative they also conserve the energy approximately. A special class of symplectic systems are separable systems which can be written in the form dqdt/dt = f1(p), dpdt/dt = f2(q), where (q,p) are the state of system. The space of (q,p) is sometimes refered as the phase space and q and p are said the be the phase space variables. Symplectic systems in this special form occur widely in nature. For example the complete classical mechanics as written down by Newton, Lagrange and Hamilton can be forumulated in this framework. Of course, the separability of the system depends on the specific choice of coordinates.

Integrable symplectic systems can be solved by odeint by means of the symplectic_euler stepper and a symplectic Runge-Kutta-Nystrom method of sixth-order. These stepper assume that the system is autonomous, hence the time will not explicitly occur. Further they fullfil in principle the default Stepper concept, but they expect the system to be a pair of callable objects. The first entry of this pair calculates f1(p) while the second calculates f2(q). The syntax is sys.first(p,dqdt) and sys.second(q,dpdt), where the first and second part can be again simple C-functions of functors. An example is the harmonic oscillator:

	dqdt = p
	dpdt = -q

The state of such an ODE consist now also of two parts, the part for q (also called the coordinates) and the part for p (the momenta). The full example for the harmonic oscillator is now: 

Many Hamiltonian system can be written as dq/dt=p, dp/dt=f(q) which is computationally much easier then the full separable system. Very often, it is also possible to transform the original equations of motion to bring the system in this simplified form. This kind of system can be used in the symplectic solvers, by simply passing f(p) to the do_step method, again f(p) will be represented by a simple C-function or a functor. Here, the above example of the harmonic oscaillator can be written as 