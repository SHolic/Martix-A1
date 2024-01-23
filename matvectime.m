n = 500;
for jay = 1:4
    if jay > 1
        oldtime = time;
    end
    A = randn(n);
    x = randn(n,1);
    t = cputime;
    for rep = 1:100 % compute the product 100 times
        b = A*x;
    end
    matrixsize = n
    time = cputime - t
    if jay > 1
        ratio = time/oldtime
    end
    n = 2*n;
end
