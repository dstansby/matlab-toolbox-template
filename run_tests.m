% Run all tests in current working directory
%
% This runs all tests in the current working directory, and produces
% code coverage files in the "artifacts" directory

import matlab.unittest.TestRunner
import matlab.unittest.Verbosity
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.XMLPlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat

suite = testsuite(pwd, 'IncludeSubfolders', true);

[~,~] = mkdir('artifacts');

runner = TestRunner.withTextOutput('OutputDetail', Verbosity.Detailed);
runner.addPlugin(XMLPlugin.producingJUnitFormat('artifacts/results.xml'))
runner.addPlugin(CodeCoveragePlugin.forFolder(pwd, 'IncludingSubfolders', true, 'Producing', CoberturaFormat('artifacts/cobertura.xml')))

results = runner.run(suite)
assertSuccess(results);
