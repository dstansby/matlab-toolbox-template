% Linter warning prototype

classdef code_quality_test < matlab.unittest.TestCase

  methods(Static)

    function serious_problems = filterProblems(problems, mfile)
      % Some problems should only be warnings, not errors.
      % This function filters them out.
      % You can add more problems to the list if you want.
      id_of_warnings = [...
        "NAGU", ... % Value assigned to a variable is never used
      ];

      % Filter out the problems we don't want, only print them
      serious_problems = problems(~ismember({problems.identifier}, id_of_warnings));
      weak_problems = problems(ismember({problems.identifier}, id_of_warnings));

      if ~isempty(weak_problems)
        for i = 1:numel(weak_problems)
          warning(code_quality_test.problemToString(weak_problems(i)));
        end
      end

    end

    function string_representation = problemToString(problem)
      % Convert a problem to a string.
      % This is used to print the problems.
      string_representation = sprintf(...
        "%s:%d:%d: %s: %s", ...
        problem.file, ...
        problem.line, ...
        problem.column, ...
        problem.identifier, ...
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
        serious_problems = code_quality_test.filterProbems(problems, mfile);

        % Display problems if there are before failing the test
        if ~isempty(serious_problems)
          % If there are problems, print them.
          disp("Errors:")
          disp(serious_problems)
        end

        testCase.verifyEmpty(serious_problems);

      end
    end

  end

end
