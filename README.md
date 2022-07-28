# matlab-sandbox
[![Run MATLAB tests](https://github.com/dstansby/matlab-sandbox/actions/workflows/run_tests.yml/badge.svg)](https://github.com/dstansby/matlab-sandbox/actions/workflows/run_tests.yml)
[![codecov](https://codecov.io/gh/dstansby/matlab-sandbox/branch/main/graph/badge.svg?token=346NBCNNPY)](https://codecov.io/gh/dstansby/matlab-sandbox)

A sample MATLAB package with tests/CI/code coverage/etc.

## Tests
Example tests live in the [tests](tests) directory. [run_tests.m](run_tests.m) contains a script to run the tests and generate code coverage.

The tests are run on GitHub actions - see [run_tests.yml](.github/workflows/run_tests.yml) for CI configuration. Code coverage is collected and uploaded to [codecov](https://about.codecov.io/).
