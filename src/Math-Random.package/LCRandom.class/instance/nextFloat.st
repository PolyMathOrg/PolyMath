accessing
nextFloat
    "Private - Answer a pseudo-Random floating point number between 0 and 1.
    Uses a quick and dirty Linear congruential generator,"

    seed := self peekSeed.
    ^ seed / 120050.0