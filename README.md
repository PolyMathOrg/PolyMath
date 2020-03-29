<p align="center"><img alt="PolyMath" src="assets/logos/logo.png" style="width: 25%; height: 25%">
<h1 align="center">[PolyMath]</h1>
  <p align="center">
    Scientific Computing with Pharo
    <br>
    <a href="https://github.com/PolyMathOrg/PolyMath/wiki"><strong>Explore the docs »</strong></a>
    <br>
    <br>
    <a href="https://github.com/PolyMathOrg/PolyMath/issues/new?labels=Type%3A+Defect">Report a defect</a>
    |
    <a href="https://github.com/PolyMathOrg/PolyMath/issues/new?labels=Type%3A+Feature">Request feature</a>
  </p>
</p>

[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![Build Status](https://travis-ci.org/PolyMathOrg/PolyMath.svg?branch=master)](https://travis-ci.org/PolyMathOrg/PolyMath)
[![Build status](https://ci.appveyor.com/api/projects/status/3tvarh2xi22max8h?svg=true)](https://ci.appveyor.com/project/SergeStinckwich/polymath-88bea)
[![Coverage Status](https://coveralls.io/repos/github/PolyMathOrg/PolyMath/badge.svg?branch=development)](https://coveralls.io/github/PolyMathOrg/PolyMath?branch=development)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/PolyMathOrg/PolyMath/master/LICENSE)

<img width="1675" alt="Screenshot 2019-04-24 at 11 12 57" src="https://user-images.githubusercontent.com/327334/56652094-66eb7780-6682-11e9-9753-101be18df67c.png">


You can load PolyMath 1.0.2 into a fresh Pharo 8.0 image with:

```Smalltalk
Metacello new
        repository: 'github://PolyMathOrg/PolyMath:v1.0.2/src';
        baseline: 'PolyMath';
        load
```

and the latest development version of PolyMath:

```Smalltalk
Metacello new
        repository: 'github://PolyMathOrg/PolyMath/src';
        baseline: 'PolyMath';
        load
```


We have **816** green tests ! At the moment, all the development happens in the master branch (we are using trunk-based development).

PolyMath is a Pharo project, similar to existing scientific libraries like NumPy, SciPy for Python or SciRuby for Ruby. PolyMath already provides the following basic functionalities:
- complex and quaternions extensions,
- random number generators,
- fuzzy algorithms,
- automatic differentiation,
- KDE-trees,
- Numerical methods,
- Ordinary Differential Equation (ODE) solvers.

The authoritative book on PolyMath is available online: https://github.com/SquareBracketAssociates/PolyMath-book

Some documentation (work in progress) is available on the Wiki:
https://github.com/PolyMathOrg/PolyMath/wiki

Natalia wrote some explanation about benchmarking PolyMath in the Pharo For Enterprise Book: https://github.com/SquareBracketAssociates/PharoForTheEnterprise-english/blob/ae40e7ab6f7651f6e7c271869eb1efc4e531e774/ComparingSolutions/ComparingSolutions.pier

To add PolyMath to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'PolyMath'
    	with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ]
```

## How to contribute to PolyMath

We welcome submissions! A google group exists for this project at http://groups.google.com/group/polymath-project
