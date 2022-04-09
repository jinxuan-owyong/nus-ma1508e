classdef MA1508E
    methods
        function b = orthogonalProj(~, A, u)
            %A: The matrix to be projected onto
            %u: The vector to project
            %Returns: The projection of u onto A
            [~, w] = size(u);
            if (det(A) == 0)
                fprintf("Error: Unable to preform projection. Input matrix is singular.\n");
                return;
            end
            if (w ~= 1) 
                fprintf("Warning: The input vector u has more than one column\n"); 
            end
            b = A * inv(A'*A) * A' * u;
        end
        
        function res = isOrthogonalSet(~, S)
            [~, w] = size(S);
            for i = 1:w
                for j = i:w
                    if (i == j) continue; end
                    if dot(S(:, i), S(:, j)) ~= 0
                        fprintf("The set is not orthogonal\n");
                        res = false;
                        return
                    end
                end
            end
                fprintf("The set is orthogonal\n");
                res = true;
        end
        
        function isOrthonormalSet(obj, S)  
            if (~obj.isOrthogonalSet(S)) return; end
            
            [~, w] = size(S);
            for i = 1:w
                if (abs(norm(S(:, i)) - 1) >= 0.00001)
                    fprintf("The set is not orthonormal\n");
                    return
                end
            end
            fprintf("The set is orthonormal\n");
        end
        
        function isOrthogonalTo(~, S, target)
            %M: The matrix containing the set of vectors to check against
            %target: The vector to check if orthogonal
            [~, w] = size(S);
            for i = 1:w
                if dot(S(:, i), target) ~= 0
                    fprintf("The vector is not orthogonal to the matrix\n");
                    return
                end
            end
            fprintf("The vector is orthogonal to the matrix\n");
        end  
        
        function [u,r] = gramSchmidt(~, v)
            %Reference: https://arxiv.org/ftp/arxiv/papers/1607/1607.04759.pdf
            %Input:   v - m x n matrix of vectors 
            %Returns: u - m x n matrix of orthogonal vectors1
            %         r - n x n matrix 
            [~,N] = size(v);
            u(:,1) = v(:,1);
            r = eye(N,N); % eye(•) is a built-in function of MATLAB®
            for n = 2:N % eye(•) represents identity matrix
                acu = 0;
                for m = 1:n-1
                    num = dot(v(:,n),u(:,m)); % dot(•,•) represents inner product of vectors in MATLAB®
                    den = dot(u(:,m),u(:,m)); % dot(•,•) is a built-in function of MATLAB®
                    r(n,m) = num/den;
                    acu = acu + r(n,m)*u(:,m);
                end
             u(:,n) = v(:,n) - acu;
            end
        end
    
        function ON = toOrthonormalSet(~, OG)
            [rows, cols] = size(OG);
            ON = zeros(rows, cols);
            for i = 1:cols
                ON(:, i) = OG(:, i) / norm(OG(:, i));
            end
        end

        function T = dotWithSet(~, S, v)
            [S_rows, S_cols] = size(S);
            [v_rows, ~] = size(v);
            
            if S_rows ~= v_rows
               fprintf("Error: v does not have the same number of rows as S!\n");
               return;
            end
            
            T = zeros(1, S_cols);
            for i = 1:S_cols
                T(:, i) = dot(S(:, i), v);
            end
        end
    end
end
