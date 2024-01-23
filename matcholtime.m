n = 500;
for jay = 1:4
    if jay > 1; oldtime = time; end
    M = randn(n);
    A = M'*M;
    t = cputime;
    for rep = 1:5
        R = chol(A);
    end
    matrixsize = n
    time = cputime - t
    if jay > 1
        ratio = time/oldtime 
    end
    n = 2*n;
end
