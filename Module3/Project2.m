% nMax = 100; % max number of days to simulate
% 
% r = 0.1;
% k = 0.6;
% 
% x = zeros(1,nMax); % fraction caffeinated
% x(1) = 0.2; % initial fraction caffeinated
% 
% for n=2:nMax
%     x(n) = x(n-1) + r * (1-x(n-1)/k) * x(n-1);
% end % finished loop through days
% 
% % THE MODEL ^
% % ------------------------------------------
% % THE BEHAVIOR / THE OUTPUT ? 
% 
% figure(1); 
% plot(x,'-ok');
% ylabel('Population')
% xlabel('Days')
% 
% r = 2.1;
% x = zeros(1,nMax);
% x(1) = 0.2;
% 
% for n=2:nMax
%     x(n) = x(n-1) + r * (1-x(n-1)/k) * x(n-1);
% end
% 
% figure(2); 
% plot(x,'-ob');
% ylabel('Population')
% xlabel('Days')
% 
% %------------------------
% r = 2.5;
% k = 0.6;
% x = zeros(1,nMax);
% x(1) = 0.1;
% 
% for n=2:nMax
%     x(n) = x(n-1) + r * (1-x(n-1)/k) * x(n-1);
% end
% 
% figure(3); 
% plot(x,'-or');
% ylabel('Population')
% xlabel('Days')
% 
% %-------------------------
k = 0.6;
figure(1);
hold on
numTrials = 100;

nMax = 100;
for i = 1:numTrials
    r = 0 + 3.0 / numTrials * i;
    x = zeros(1,nMax);
    x(1) = 0.1;

    for n=2:nMax
        x(n) = x(n-1) + r * (1-x(n-1)/k) * x(n-1);
    end
%     if (x(nMax / 2) == x(nMax) || x(nMax / 2 + 1) == x(nMax))
%         scatter(r, x(100), 2, 'k')
%     else
%         scatter(r, 0, 2, 'red') %steady state not reached
%     end
    for m = 0:8
        scatter(r, x(numTrials - m), 2, 'k')
    end

end



