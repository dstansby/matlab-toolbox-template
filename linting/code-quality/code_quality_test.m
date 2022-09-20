% Linter warning prototype

classdef code_quality_test < matlab.unittest.TestCase

  methods

    function serious_problems = filterProblems(testCase, problems, mfile)
      % Some of the code quality errors are not serious enough to fail the test
      % suite. This function filters out the ones that are not serious enough.
      % The list of errors that are not serious enough is hard-coded in the next
      % variable, and can be updated as needed.
      % A problem in this list will only print a warning on the consode.
      id_of_warnings = [...
        "PSIZE", ... %  NUMEL(x) is usually faster than PROD(SIZE(x)).
      ];

      % Filter out the problems we don't want, only print them
      serious_problems = problems(~ismember({problems.id}, id_of_warnings));
      weak_problems = problems(ismember({problems.id}, id_of_warnings));

      if ~isempty(weak_problems)
        disp("");
        disp("Linting errors:");
        for i = 1:numel(weak_problems)
          disp(testCase.problemToString(weak_problems(i), mfile));
        end
        disp("");
      end

    end

    function string_representation = problemToString(testCase, problem, mfile)
      % Convert a problem to a string.
      % This is used to print the problems.
      string_representation = sprintf(...
        "%s:%d:%d - Error: %s %s\n", ...
        mfile, ...
        problem.line, ...
        problem.column, ...
        problem.id, ...
        problem.message);
    end
  end

  methods(Test)

    function testCodeQuality(testCase)

      % Get all m-files in `mypackage`, recursively.
      % Keep the full path, so we can use it later.
      mfiles = dir(fullfile('..','..','+mypackage', '**', '*.m'));

      % Check each one with `checkcode`.
      for i = 1:numel(mfiles)
        % Get the full path to the file.
        mfile = fullfile(mfiles(i).folder, mfiles(i).name);

        % Run `checkcode` on the file.
        [problems, ~] = checkcode(mfile, "-id");

        % Filter out weak problems
        serious_problems = testCase.filterProblems(problems, mfile);

        % Display problems if there are before failing the test
        if ~isempty(serious_problems)
          % If there are problems, print them.
          disp("Linting Errors:")
          for i = 1:numel(serious_problems)
            disp(testCase.problemToString(serious_problems(i), mfile));
          end
        end

        testCase.verifyEmpty(serious_problems);

      end
    end

  end

end
