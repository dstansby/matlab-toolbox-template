% Runs code quality tests in current working directory
%
% This code quality tests in the current working directory

import matlab.unittest.TestRunner
import matlab.unittest.Verbosity


oldpath = path;
path('.', oldpath);

code_quality_path = fullfile(pwd, 'linting', 'code-quality');
suite = testsuite(code_quality_path, 'IncludeSubfolders', true);

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);

results = runner.run(suite)
assertSuccess(results);
