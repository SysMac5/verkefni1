function x=A_func(i,j,n)
    if i == 1 && j < 5
        s = [16,-9,8/3,-1/4];
        x = s(j);
    elseif (i == n - 1 || i == n) && j > n - 4
        s = [16/17,-60/17,72/17,-28/17;-12/17,96/17,-156/17,72/17];
        x = s(i-n+2, j-n+4);
    elseif i == j
        x = 6;
    elseif abs(i-j) == 1
        x = -4;
    elseif abs(i-j) == 2
        x = 1;
    else
        x = 0;
    end
end