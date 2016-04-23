stream access
peek
    "Answer a pseudo-Random floating point number between 0 and 1."

    ^ self peekSeed / SmallInteger maxVal asFloat