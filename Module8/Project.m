
% lambda = 1;
% theta = 1000;
% alpha = 2;
% f =@(N) lambda * N * (1- (N/theta)^alpha);
% 
% dxdt = @(t,x)[f(x(1))];
% [T,X] = ode45(dxdt, [0,20], 200);
% figure(1)
% plot(T,X(:));

%%%%%%%%%part b
data = readmatrix("BacteriaGrowthData.xlsx");
timepoints = data(2:end,1);
roomtemp = data(2:end,2);
deg37 = data(2:end,3);
figure(2); hold on;
plot(timepoints, roomtemp, '-r');
plot(timepoints, deg37, '-b')

%%%%%%%%%%part c
% sse = calcSSE(1, 0.5, 0.5);
% display(sse)
[x,fval] = fminsearch(@calcSSE, [0.3,1,2])
% 
lambda = x(1)
theta = x(2)
alpha = x(3)
f =@(N) lambda * N * (1- (N/theta)^alpha);
    
dxdt = @(t,x)[f(x(1))];
    [T,X] = ode45(dxdt, timepoints, deg37(1));
    simulated = X(:);


plot(T,simulated, '-p');



function [sse] = calcSSE(param)
    lambda = param(1)
    theta = param(2)
    alpha = param(3)
    data = readmatrix("BacteriaGrowthData.xlsx");
    timepoints = data(2:end,1);
    deg37 = data(2:end,3);
    f =@(N) lambda * N * (1- (N/theta)^alpha);
    
    dxdt = @(t,x)[f(x(1))];
    [T,X] = ode45(dxdt, timepoints, deg37(1));
    simulated = X(:);
    sse = 0;

    for i=1:size(timepoints)
        sse = sse + (simulated(i) - deg37(i)).^2;
    end
end