tests
testAccumulate
"|m s|
m :=DhbMatrix rows: #((1 2 3)(-1 -2 7)(5 6 7)).
s :=DhbSymmetricMatrix rows: #((1 2 3)(2 1 4)(3 4 0)).
s accumulate: m."
"now s is not symmetric anymore, hence this should work, but it does not:"
"self deny: s isSymmetric ."
"the same thing is true for accumulateNegated: .
(a accumulate: b) is essentially the same as (a:=a+b) .
both methods are used in the symmetric case only (!) in methods crlInverse and inversePureCRL. and they are not used to accumulate several matrices. obvously the only reason for their existence is that they are somewhat faster than a:=a+b and a:=a-b. but now, because the addition of symmetric matrices is optimized, there is no problem in using normal addition. hence i removed them "
