% A simple parametrized test
classdef parametrized_test < matlab.unittest.TestCase

    properties (TestParameter)
        % Parameters that can be used to parametrize tests
        num1 = {1, 2};
        num2 = {3, 4};
    end

    methods (Test)
        function testClass(testCase, num1, num2)
            instance = mypackage.myClass(num1, num2);
            testCase.verifyEqual(instance.a, num1);
            testCase.verifyEqual(instance.b, num2);
            testCase.verifyEqual(instance.aPlusb(), num1 + num2);
        end
    end
end
