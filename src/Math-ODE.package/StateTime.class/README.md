A StateTime class is a generalization of point. It holds both a state and a time.

We don't want to  use Point, since state may be a vector quantity, and the behavior of array @ number is a little off (it stores points in an array, what we want is the array itself in state, and the scalar quantity in time).