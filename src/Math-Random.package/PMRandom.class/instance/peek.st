accessing
peek
    "Private - Answer a pseudo-Random floating point number between 0 and 1.
    Uses Park and Miller's 'Minimum Standard' congruential generator."

    ^ self peekSeed / 16r7FFFFFFF asFloat
