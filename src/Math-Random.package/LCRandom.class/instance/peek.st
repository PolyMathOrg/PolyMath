accessing
peek
    "Private - Answer a pseudo-Random floating point number between 0 and 1.
    Uses a simple, but fast, Linear Congruential generator."

    ^ self peekSeed / 120050.0