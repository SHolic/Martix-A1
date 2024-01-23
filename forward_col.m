function [b] = forward_col(g, b)
    % Check whether the matrix is a square matrix
    [n, m] = size(g);
    if n ~= m
        error("This is not a square matrix, error.");
    end

    for j = 1:n
        if g(j,j) == 0
            error("This is singular matrix, error.");
        end
        b(j) = b(j) / g(j,j);
        for i = j+1:n
            b(i) = b(i) - g(i,j)*b(j);
        end
    end
end