classdef MA1508E
    properties (Constant)
        ZERO_TOLERANCE = 10^-6;
    end

    methods
        function b = orthogonalProj(~, A, u)
            %A: The matrix to be projected onto
            %u: The vector to project
            %Returns: The projection of u onto A
            [~, w] = size(u);
            if (w ~= 1) 
                fprintf("Warning: The input vector u has more than one column\n"); 
            end
            b = A * inv(A'*A) * A' * u;
        end
        
        function res = isOrthogonalSet(obj, S)    
            [~, w] = size(S);
            for i = 1:w
                for j = i:w
                    if (i == j) continue; end
                    if dot(S(:, i), S(:, j)) > obj.ZERO_TOLERANCE
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
                if (abs(norm(S(:, i)) - 1) > obj.ZERO_TOLERANCE)
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
        
        function ev = getEigenvalues(~, A)
            syms x;
            px = charpoly(A, x);
            f = factor(px, x);
            [~, nFactors] = size(f);
            
            j = 0;
            for i = 1:nFactors
                roots = solve(f(i) == 0, x);
                nRoots = polynomialDegree(f(i));
                
                for k = 1:nRoots
                    ev(i + j) = roots(k);
                    % Complex roots
                    if nRoots > 1 && k < nRoots
                        j = j + 1;
                    end
                end
            end
        end
        
        function v1 = getEigenvector(~, A, lambda)
            [rows, cols] = size(A);
            if rows ~= cols
                fprintf("Input matrix is not square!\n");
                return;
            end

            M = lambda * eye(cols) - A;
            v1 = null(M, 'r');
        end

        function v2 = getGeneralisedEigenvector(obj, A, lambda)
            [rows, cols] = size(A);
            if rows ~= cols
                fprintf("Input matrix is not square!\n");
                return;
            end

            M = A - lambda * eye(cols);
            v1 = obj.getEigenvector(A, lambda);
            
            fprintf("Get generalised eigenvector from the returned RREF\n")
            v2 = [M v1];
        end
        
        function s = generateInitialConditions(~, n)
            conds = zeros(n, 2);
            for i = 1:n
                fprintf("Enter the t value for y%i: ", i);
                conds(i, 1) = input("");
                fprintf("Enter the result of y%i(%i): ", i, conds(i, 1));
                conds(i, 2) = input("");
            end
            
            s = "[";
            for i = 1:n
                s = s + "y" + i + "(" + conds(i, 1) + ")==" + conds(i, 2);
                if i ~= n
                    s = s + ", ";
                end
            end
            s = s + "]";
        end

        function res = solveDifferentialSystem(obj, A, isInitial)
            [rows, ~] = size(A);
            switch rows
                case 2
                    syms y1(t) y2(t);
                    y = [y1; y2];
                case 3
                    syms y1(t) y2(t) y3(t);
                    y = [y1; y2; y3];
                case 4
                    syms y1(t) y2(t) y3(t) y4(t);
                    y = [y1; y2; y3; y4];
                case 5
                    syms y1(t) y2(t) y3(t) y4(t) y5(t);
                    y = [y1; y2; y3; y4; y5];
                otherwise
                    fprintf("Unsupported size.\n");
                    return;
            end

            if ~isInitial
                res = dsolve(diff(y,t) == A * y);
            else
                conds = eval(obj.generateInitialConditions(rows));
                res = dsolve(diff(y,t) == A * y, conds);
            end
        end

        function res = isValidERO(~, str)
            % Match regular expression, includes floating point coefficient
            isAdd = any(regexp(str, "R\d [+-] \d+.?\d*R\d"));
            isSwap = any(regexp(str, "R\d S R\d"));
            isMultiple = any(regexp(str, "-?\d+.?\d*R\d"));
            
            if ~isAdd && ~isSwap && ~isMultiple
                res = false;
                return;
            end

            res = true;
        end

        function M = generateElemAdd(~, data)
            M = eye(data.size);
            leftVal = data.left(2);
            rightCOE = data.right(1);
            rightVal = data.right(2);

            M(leftVal, rightVal) = rightCOE;
        end

        function M = generateElemSwap(~, data)
            M = eye(data.size);
            leftVal = data.left(2);
            rightVal = data.right(2);
    
            M(leftVal, leftVal) = 0;
            M(rightVal, rightVal) = 0;
            M(leftVal, rightVal) = 1;
            M(rightVal, leftVal) = 1;
        end

        function res = generateElemMatrix(obj, str, n)
            % Process input string
            sp = split(str);
            [rows, cols] = size(sp);

            if rows == 1 && cols == 1
                data = str2double(split(sp(1), "R"));
                coe = data(1);
                val = data(2);
                res = eye(n);
                res(val, val) = coe;
                return;
            end

            ero = struct('left', zeros(2, 1), 'op', '', 'right', zeros(2, 1), 'size', n);
            
            ero.left = str2double(split(sp(1), "R"));
            ero.op = sp(2);
            ero.right = str2double(split(sp(3), "R"));
            
            switch ero.op
                case '+'
                    res = obj.generateElemAdd(ero);
                case '-'
                    ero.right(1) = -ero.right(1);
                    res = obj.generateElemAdd(ero);
                case 'S'
                    res = obj.generateElemSwap(ero);
                otherwise
                    fprintf("Something went wrong.\n");
            end
        end

        function performERO(obj, A)
            [rows, ~] = size(A);
            M = A;
            command = "";
            while true
                command = input("Enter the elementary row operation: ");
                if command == "quit" 
                    return;
                end
                
                if ~obj.isValidERO(command)
                    fprintf("Invalid ERO.\n");
                    continue;
                end

                M = obj.generateElemMatrix(command, rows) * M;
                fprintf("--> %s:\n\n", command);
                disp(M);
            end
        end

        function res = calcLSS(~, A, b)
            [rowsA, ~] = size(A);
            [rowsB, ~] = size(b);
            if rowsA ~= rowsB
                fprintf("Error: Inputs need to have the same number of rows!\n");
                return;
            end

            % Calculate least squares solution of Ax = b
            left = A' * A;
            right = A' * b;
            R = rref([left right]);
            [~, cols] = size(R);
            v = R(:, cols);
            p = null(R(:, 1:cols - 1), "r");
            
            param = 's';
            fprintf("The general solution has parameters ");
            [~, numP] = size(p);
            for i = 1:numP
                fprintf("%c, ", param);
                param = char(param + 1);
            end
            fprintf("from columns %i to %i", 2, 1 + numP);
           
            res = [v p];
        end

        function LI = leftInverse(~, A)
            [rows, cols] = size(A);
            if rows < cols 
                fprintf("The matrix does not have a left inverse!\n");
                return;
            end

            if rows == cols
                fprintf("The matrix is square, its inverse is:\n");
                LI = inv(A);
                return
            end
            
            fprintf("The left inverse of the matrix exists.")
            LI = inv(A' * A) * A';
        end

        function RI = rightInverse(~, A)
            [rows, cols] = size(A);
            if rows > cols 
                fprintf("The matrix does not have a right inverse!\n");
                return;
            end
            
            if rows == cols
                fprintf("The matrix is square, its inverse is:\n");
                disp(inv(A));
                return
            end
            
            fprintf("The right inverse of the matrix exists.")
            RI = A' * inv(A * A');
        end
    end
end
