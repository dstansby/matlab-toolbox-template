function ave = my_average_function(x)
    % Take the mean of a set of data.
    %
    % Parameters
    % ----------
    % x:
    %   Input array.
    %
    % Returns
    % -------
    % ave:
    %   Mean of the input.
    ave = sum(x(:)) / numel(x);
end
