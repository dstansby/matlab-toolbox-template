% Run all tests in current working directory
%
% This runs all tests in the current working directory, and produces
% code coverage files in the "artifacts" directory

import matlab.unittest.TestRunner
import matlab.unittest.Verbosity


oldpath = path;
path('.', oldpath);

code_quality_path = fullfile(pwd, 'linting', 'code-quality');
suite = testsuite(code_quality_path, 'IncludeSubfolders', true);

[~,~] = mkdir('artifacts');

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);

results = runner.run(suite)
assertSuccess(results);
