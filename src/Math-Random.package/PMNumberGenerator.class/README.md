A NumberGenerator is a stream of numbers. All NumberGenerators respond to #next.

As generator I use a PMRandomGenerator instance as defined by the class message defaultGeneratorClass.
My API is 

- generator: 
- next and peek

By default I use a Park and Miller minimum congruent random number generator. See PMParkMillerMinimumRandomGenerator

