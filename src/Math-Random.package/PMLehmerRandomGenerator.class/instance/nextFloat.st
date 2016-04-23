private
nextFloat
    "Private - Answer a Random Float between 0 and 1. Uses Lehmer's linear congruential method."

    seed := self peekSeed.
    ^ seed / SmallInteger maxVal asFloat