accessing
consistsOfFloatsOnly:aBoolean
"experimental: decides whether an interval consists of reals or floats. only affects #split:  at the moment (and only in a very rudimentary way). class initialize sets it by default to false. this is more of a heuristic than a mathematical decision  and trying to make this rigorous - eg by applying it to #difference: or in a more complete way to #split: - only introduces bugs that are not necessarily simple to track down."
^ConsistsOfFloatsOnly :=aBoolean