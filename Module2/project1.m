% Project 1

nMax = 22; % max number of days to simulate

c= -0.8;
d= 0.156;

x = zeros(1,nMax); 
x(1) = 0.1; 

y = zeros(1,nMax); 
y(1) = 0.1; 

for n=2:nMax
    
    x(n) = x(n-1)^2 - y(n-1)^2 + c;
    y(n) = 2 * x(n-1) * y(n-1) + d;

end % finished loop through days

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

plot(xStart(1), yStart(1), '.k');

% ----------------------------
red = zeros(1,trials); %1 if red 0 if blue

for i = 1:trials
    
    x(1) = xStart(i);
    y(1) = yStart(i);

    for n=2:nMax 
        x(n) = x(n-1)^2 - y(n-1)^2 + c;
        y(n) = 2 * x(n-1) * y(n-1) + d;
    end
    if ((x(22) < 2) && (x(22) >-2)) 
        plot(xStart(i), yStart(i), '.b');
        hold on
    else 
        plot(xStart(i), yStart(i), '.r');
        hold on
    end
end