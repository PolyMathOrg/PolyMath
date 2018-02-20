# PolyMath

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/PolyMathOrg/PolyMath.svg?branch=master)](https://travis-ci.org/PolyMathOrg/PolyMath)
[![Build status](https://ci.appveyor.com/api/projects/status/t4o6by4psutfpmp7?svg=true)](https://ci.appveyor.com/project/SergeStinckwich/polymath)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/PolyMath/master/LICENSE)

PolyMath is the new name of [SciSmalltalk](https://github.com/SergeStinckwich/SciSmalltalk).
All the code and documentation will be moved here soon. 

```Smalltalk
Metacello new 
  repository: 'http://smalltalkhub.com/mc/PolyMath/PolyMath/main';
  configuration: 'PolyMath';
  version: '0.98';
  load
```

We have **742** green tests !
 
PolyMath is a new Smalltalk project, similar to existing scientific libraries like NumPy, SciPy for Python or SciRuby for Ruby. PolyMath already provide the following basic functionalities:
- complex and quaternions extensions,
- random number generators,
- fuzzy algorithms,
- KDE-trees,
- Didier Besset's numerical methods,
- Ordinary Differential Equation (ODE) solvers.

[![Lorentz attractor with PolyMath and GraphET](https://pbs.twimg.com/media/Ble65B3CYAEkMoR.jpg)](https://twitter.com/SergeStinckwich/status/457039376111788032)

:bangbang: Current active development repository is located at **[SmalltalkHub](http://smalltalkhub.com/#!/~PolyMath/PolyMath)**

A book about PolyMath called "Numerical Methods" is available online: https://github.com/SquareBracketAssociates/NumericalMethods/releases/tag/snapshot-2016-01-17

Some documentation (to be cleaned and reorganized) about PolyMath is available on the Wiki here: 
https://github.com/SergeStinckwich/SciSmalltalk/wiki

Natalia wrote some explanation about benchmarking PolyMath in the Pharo For Enterprise Book: https://github.com/SquareBracketAssociates/PharoForTheEnterprise-english/blob/ae40e7ab6f7651f6e7c271869eb1efc4e531e774/ComparingSolutions/ComparingSolutions.pier

## How to contribute to PolyMath

We welcome submissions! A google group exists for this project at http://groups.google.com/group/scismalltalk
