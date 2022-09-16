classdef MyClass
    % MyClass A dummy class
    %   Detailed explanation goes here

    properties
        a     % First public property
        b     % Second public property
    end
    properties (Access=private)
        three   % Do not show this property
    end

    methods
        function obj = MyClass(a, b)
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
        function result = returnTrue
            result = true
        end
    end

end
