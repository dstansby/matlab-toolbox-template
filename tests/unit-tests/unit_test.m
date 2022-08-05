% Sample unit test class
%
% The class name must be equal to the filename
% Functions can have arbiratry names, but must take the testCase argument
%
% Use the `run_tests.m` file in the roof of this repository to run
% the tests.

classdef unit_test < matlab.unittest.TestCase
    methods (Test)

        function testEqual(testCase)
            result = mypackage.add_one([1, 3])
            testCase.verifyEqual(result, [2, 4])
        end

        function testNotEqual(testCase)
            testCase.verifyNotEqual(1, 2)
        end

        function testClass(testCase)
            instance = mypackage.myClass(1, 2)
            testCase.verifyEqual(instance.a, 1)
            testCase.verifyEqual(instance.b, 2)
            testCase.verifyEqual(instance.aPlusb(), 3)
            testCase.verifyTrue(instance.return_true())
        end
    end
end
