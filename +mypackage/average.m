function ave = average(x)
    % Take the mean of a set of data.
    %
    % :param x: Input array
    % :returns: Mean of the input
    ave = sum(x(:)) / numel(x);
end
