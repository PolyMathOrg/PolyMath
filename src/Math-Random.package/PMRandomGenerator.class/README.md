I'm  the top abstract class of the pseudo-random numbers generator.

The applications of Pseudo-Random Numbers Generators are many ones:
- Simulations
- Sampling
- Cryptography
- Numeric Analysis
- Games
- Aesthetics

Internally, one can classify Random Number Generator according to several views, so choosing one or another is fully dependent of your requirements:

From the production view, there is always a tradeoff between: speed and safety

Another view, based on the seed they use, is:
- Deterministic: They take the seed value from a specific number. These ones are called  Pseudo random number generators.
- Non-deterministic: They take the seed value from a physical source non-predictable and outside the human control. These are called true Random number generators.

Along these terms, deterministic Random Number Generator  are divided between:
- Normal PRNG
-- Linear Congruential
-- Non-Linear Congruential
- Cryptography safe PRNG (CSPRNG)
-- DSA
-- ECDSA

And finally, there's a taxonomy more related with the internal implementation, based on how the pseudo-generator make its random variables following a distribution function.


