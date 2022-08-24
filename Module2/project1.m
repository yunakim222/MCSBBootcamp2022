% Project 1

nMax = 22; % max number of days to simulate

c= -0.8;
d= 0.156;

x = zeros(1,nMax); 
y = zeros(1,nMax); 

% for n=2:nMax
%     
%     x(n) = x(n-1)^2 - y(n-1)^2 + c;
%     y(n) = 2 * x(n-1) * y(n-1) + d;
% 
% end

% THE MODEL ^
% ------------------------------------------
% THE BEHAVIOR / THE OUTPUT ? 
% 
% figure(1); 
% plot(x,y,'ok');
% ylabel('x(n)')
% xlabel('n')
trials = 10^5;

xStart = 4*rand(1,trials)-2;
yStart = 4*rand(1,trials)-2;

% plot(xStart(1), yStart(1), '.k');
% ----------------------------

for i = 1:trials
    
    x(1) = xStart(i);
    y(1) = yStart(i);
    n_at_exit = 1;

    for n=2:nMax 
        x(n) = x(n-1)^2 - y(n-1)^2 + c;
        y(n) = 2 * x(n-1) * y(n-1) + d;

        if (x(n) < 2 && x(n) > -2 && y(n) < 2 && y(n) > -2)
            n_at_exit = n_at_exit + 1;
        else 
            break;
        end
    end
    scatter(xStart(i), yStart(i),2, n_at_exit);
    colormap(jet(22))
    hold on
end