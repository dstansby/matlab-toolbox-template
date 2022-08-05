classdef myClass
    % myClass A dummy class
    %   Detailed explanation goes here

    properties
        a     % First public property
        b     % Second public property
    end
    properties (Access=private)
        Three   % Do not show this property
    end

    methods
        function obj = myClass(a, b)
            % Constructor
            obj.a = a
            obj.b = b
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
