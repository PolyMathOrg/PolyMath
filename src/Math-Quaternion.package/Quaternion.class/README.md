Quaternion are to 3D rotations what Complex are to plane rotations.

They are formed with one real part and three unreal parts.
We will note the real part qr, and the unreal part qi*i + qj*j + qk*k, where :
	i*i=j*j=k*k=-1
	i*j=-j*i=k
	j*k=-k*j=i
	k*i=-i*k=j

A 3D rotation of angle theta around axis [u v w] can be associated to quaternion :
	cos(theta/2) + sin(theta/2) * (u i + v j + w k)
Such a quaternion is unitary (have a unit norm)
Product of quaternion is equivalent to product of rotation matrix.
Quaternion conjugate is equivalent to rotation matrix transpose.

A quaternion can also be decomposed into two complex numbers
(qr i: qi) + (qj i: qk) j

Instance Variables:
	qr	<Number>	real part
	qi	<Number>	first unreal part
	qj	<Number>	second unreal part
	qk	<Number>	third unreal part

