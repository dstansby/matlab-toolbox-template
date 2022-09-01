% Sample unit test class
%
% The class name must be equal to the filename
% Functions can have arbiratry names, but must take the testCase argument
%
% Use the `run_tests.m` file in the roof of this repository to run
% the tests.

classdef unit_test < matlab.unittest.TestCase
    properties (TestParameter)
        % Parameters that can be used to parametrize tests
        num1 = {1, 2};
        num2 = {3, 4};
    end

    methods (Test)
        function testEqual(testCase)
            result = mypackage.add_one([1, 3])
            testCase.verifyEqual(result, [2, 4])
        end

        function testNotEqual(testCase)
            testCase.verifyNotEqual(1, 2)
        end

        function testClass(testCase, num1, num2)
            instance = mypackage.myClass(num1, num2)
            testCase.verifyEqual(instance.a, num1)
            testCase.verifyEqual(instance.b, num2)
            testCase.verifyEqual(instance.aPlusb(), num1 + num2)
            testCase.verifyTrue(instance.return_true())
        end
    end
end
