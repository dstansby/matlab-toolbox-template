| :exclamation:  This repository is no longer actively developed or maintained. You are encouraged to fork it if it is useful and you want to make changes/updates!  |
|-----------------------------------------|


# matlab-sandbox
[![Run MATLAB tests](https://github.com/dstansby/matlab-sandbox/actions/workflows/run_tests.yml/badge.svg)](https://github.com/dstansby/matlab-sandbox/actions/workflows/run_tests.yml)
[![codecov](https://codecov.io/gh/dstansby/matlab-sandbox/branch/main/graph/badge.svg?token=346NBCNNPY)](https://codecov.io/gh/dstansby/matlab-sandbox)

A sample MATLAB package with all the nuts and bolts needed for a nice open source package. The package source code is in [+mypackage](+mypackage).

## Tests
Example tests live in the [tests](tests) directory.
[run_tests.m](run_tests.m) contains a script to run the tests and generate code coverage.
To run tests locally use:
```bash
matlab -batch run_tests
```

The tests are run on GitHub actions - see [run_tests.yml](.github/workflows/run_tests.yml) for CI configuration.
Code coverage is collected and uploaded to [codecov](https://about.codecov.io/).

To run a subset of the tests instead of all of them, make sure the test you want to run is on the MATLAB path and use `run(my_test_file)`.

The tests will output a file with test timings to `artifacts/results.xml`.
This can be parsed into a JSON file using `benchmarks/parse_performance.py`.

## Docs
Documentation is automatically generated from MATLAB comments, e.g.
```matlab
%% Description
% |addOne| adds one to the input.
%
%% Usage
%
%   a = addOne(b)
%
%% Inputs
%  |b| - (number) Number to add one to.
%
%% Outputs
%
% |a| - (number) Input plus one.
function result = addOne(x)
    result = x + 1
end
```
The documentation is compiled into static HTML pages using the [make_docs.m](./make_docs.m) script.

## Linting
The `run_code_quality.m` script runs linting on the MATLAB code to check for any code linting errors.
