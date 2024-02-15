L = 2; 
w = .3; 
d = .03; 
errors = zeros(10,1); %initialize error matrix
condition = zeros(10,1); %initialize matrix for the condition number
nvalue = zeros(10,1);

for k = 1:10
    n = 10 * 2^k; 
    nvalue(k)=n;
    g = 9.81; %downward force due to gravity
    h = L/n; %define variables
    x = h:h:L;
    I = w*d^3/12;
    E = 1.3e10;
    
    A = sparse(n,n); %initialize the matrix A
    A(1,1:4) = [16 -9 8/3 -1/4]; %enter the fixed values for the matrix
    A(2,1:4) = [-4 6 -4 1];
    A(n-1,n-3:n) = [16/17 -60/17 72/17 -28/17];
    A(n,n-3:n) = [-12/17 96/17 -156/17 72/17];
    
    for i = 3:n-2 %use for loops to fill in the remaining entries in matrix A
        A(i,i-2) = 1;
        A(i,i-1) = -4;
        A(i,i) = 6;
        A(i,i+1) = -4;
        A(i,i+2) = 1;
    end
    
    condition(k) = cond(A);    
    f = -480*w*d*g;
    fvector = f*ones(n,1);
    RHS = h^4/(E*I)*(fvector);
    y = zeros(n,1);
    ysolution = A\RHS;
    yactual = ((f/(24*E*I)).*x.^2.*(x.^2-4*L.*x+6*L^2))';
    error = abs(ysolution - yactual);
    errors(k) = error(n);
        
end

table(nvalue,errors)

table(nvalue,condition)