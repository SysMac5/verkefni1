function A = A_func_clamped(n)
    A = A_func(n);
    A(n-1,n-3:n) = [1,-4,6,-4];
    A(n,n-3:n) = [-1/4,8/3,-9,16];
end

