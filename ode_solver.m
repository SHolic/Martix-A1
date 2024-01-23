function [u] = ode_solver(n,epsilon)
    h = 1 / n; % Grid size
    a1 = -epsilon/h^2 + 1/(2*h); % Coefficient for the super-diagonal
    a2 = 2*epsilon/h^2; % Coefficient for the main diagonal
    a3 = -epsilon/h^2 - 1/(2*h); % Coefficient for the sub-diagonal

    % Constructing the tridiagonal matrix
    a1_diag = a1 * ones(n-2, 1);
    a2_diag = a2 * ones(n-1, 1);
    a3_diag = a3 * ones(n-2, 1);
    A = diag(a2_diag) + diag(a1_diag, 1) + diag(a3_diag, -1);

    f = ones(n-1, 1); % Right-hand side vector

    % Solving the linear system
    u = A\f;
end