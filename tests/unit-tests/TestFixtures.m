% Using test fixtures
%
% In this example we have two tests that need a figure. In order
% to save duplicating code, TestMethodSetup and TestMethodTeardown
% methods are run respectively before and after every individual test.
%
% To instead create setup code that runs once before all tests are run,
% create methods with the `TestClassSetup` attribute.

classdef TestFixtures < matlab.unittest.TestCase

    properties
        % Add a property to save a reference to the figure created
        % during test setup.
        TestFigure
    end

    % Any methods with the TestMethodSetup attribute are run
    % before each individual test under the Test section.
    methods(TestMethodSetup)
        function createFigure(testCase)
            % Create a figure
            testCase.TestFigure = figure;
        end
    end

    methods(TestMethodTeardown)
        % Any methods with the TestMethodTeardown attribute are
        % run after each individual test under the Test section.
        function closeFigure(testCase)
            % Close the figure
            close(testCase.TestFigure)
        end
    end

    methods(Test)
        function defaultCurrentPoint(testCase)
            % Check that the current point on the figure is the origin
            cp = testCase.TestFigure.CurrentPoint;
            testCase.verifyEqual(cp, [0 0], ...
                'Default current point is incorrect')
        end

        function defaultXLim(testCase)
            % Check that default current object is empty
            xl = xlim;
            testCase.verifyEqual(xl, [0.0 1.0], ...
                'Default x-limits should be [0 1]')
        end
    end

end
