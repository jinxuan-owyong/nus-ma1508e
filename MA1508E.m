classdef MA1508E
    methods
        function b = orthoProj(~, A, u)
            %A: The matrix to be projected onto
            %u: The vector to project
            %Returns: The projection of u onto A
            [~, w] = size(u);
            if (w ~= 1) 
                fprintf("Warning: The input vector u has more than one column\n"); 
            end
            b = A * inv(A'*A) * A' * u;
        end
        
        function isOrthogonalSet(~, S)
            [~, w] = size(S);
            for i = 1:w
                for j = i:w
                    if (i == j) continue; end
                    if dot(S(:, i), S(:, j)) ~= 0
                        fprintf("The set is not orthogonal\n");
                        return
                    end
                end
            end
                fprintf("The set is orthogonal\n");
        end
        
        function isOrthogonalTo(~, M, target)
            %M: The matrix containing the set of vectors to check against
            %target: The vector to check if orthogonal
            [~, w] = size(M);
            for i = 1:w
                if dot(M(:, i), target) ~= 0
                    fprintf("The vector is not orthogonal to the matrix\n");
                    return
                end
            end
            fprintf("The vector is orthogonal to the matrix\n");
        end  
    end
end