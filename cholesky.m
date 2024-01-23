function [a] = cholesky(a)
    % Check whether the matrix is a square matrix
    [n, m] = size(a);
    if n ~= m
        error("This is not a square matrix, error.");
    end
    
    for i = 1:n
        % compute aii
        for k = 1:(i-1)
            a(i,i) = a(i,i) - a(k,i)^2;
        end
        if a(i,i) <= 0
            error("This is not a positive definite matrix");
        end
        a(i,i) = sqrt(a(i,i));

        % compute aij
        for j = (i+1):n
            for k = 1:(i-1)
                a(i,j) = a(i,j) - a(k,i)*a(k,j);
            end
            a(i,j) = a(i,j) / a(i,i);
        end

        % get upper triangle
        a(i, 1:i-1) = zeros(i-1,1);
    end
end