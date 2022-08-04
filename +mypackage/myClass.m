classdef myClass
    % someClass A dummy class
    %   Detailed explanation goes here

    properties
        a     % First public property
        b     % Second public property
    end
    properties (Access=private)
        Three   % Do not show this property
    end

    methods
        function obj = myClass
            % Constructor
            obj.a = 1
            obj.b = 2
        end

        function result = aPlusb(obj)
            % Adds a to b
            result = obj.a + obj.b
        end
    end

    methods (Static)
        function result = return_true
            result = true
        end
    end

end
