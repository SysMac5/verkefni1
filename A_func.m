function A=A_func(n)
    A = sparse(n,n);
    for i = 1:n
        for j = (i-3):(i+3)
            if i < 1 || i > n || j < 1 || j > n
                continue
            end
            
            if i == 1 && j < 5
                s = [16,-9,8/3,-1/4];
                A(i,j) = s(j);
            elseif (i == n - 1 || i == n) && j > n - 4
                s = [16/17,-60/17,72/17,-28/17;-12/17,96/17,-156/17,72/17];
                A(i,j) = s(i-n+2, j-n+4);
            elseif i == j
                A(i,j) = 6;
            elseif abs(i-j) == 1
                A(i,j) = -4;
            elseif abs(i-j) == 2
                A(i,j) = 1;
            else
                A(i,j) = 0;
            end
        end
    end
end