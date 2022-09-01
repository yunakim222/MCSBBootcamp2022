clc;
clear;
% model parameters
eps = 0.08;
a = 1.0;
b = 0.2;

% model definition
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps*(v + a -b*w);

I0 = 1.0;
tStart = 40;
tStop = 47;
I =@(t) I0*(t>tStart).*(t<tStop);

% %% single cell
% 
% dxdt =@ (t,x) [f(x(1),x(2)) + I(t); g(x(1),x(2));];
% 
% % solve!
% [T,X] = ode45(dxdt,[0,100], [-1.5,-0.5]);
% 
% figure(); hold on;
% % plot(T,I(t),'-r');
% % set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
% plot(T,X(:,1),'-r'); % red for f
% plot(T,X(:,2),'-b'); % red for g
% % ylabel('w');
% % xlabel('v')
% % 
% % uArray = linspace(-2.5, 2.5,32);
% % wArray = linspace(-2.5, 2.52,32);
% % 
% % [uMesh,wMesh] = meshgrid(uArray, wArray);
% % 
% % % the Matlab plot command for a field of arrows is:
% % quiver(uMesh, wMesh, f(uMesh, wMesh), g(uMesh,wMesh), 0.5)
% % 
% % plot(X(:,1),X(:,2),'-r')
% % plot(X(end,1),X(end,2), 'or')

D = 0.9;
dxdt =@(t,x) [f(x(1:10),x(11:20)) + D*([x(2:10); x(1)] -2*x(1:10) + [x(10); x(1:9)] + [0;0;0;1;0;0;0;0;0;0]*I(t) );g(x(1:10),x(11:20))];
[T,X] = ode45(dxdt,[0,100], [-1.1*ones(10,1);-0.6*ones(10,1)]);

% plot results
% time series
figure(4); clf; hold on; box on;
%plot(T,X)
plot(T,X(:,1:10));
xlabel('Time');
ylabel('Voltage')

figure(5)
% movie
for nt=1:numel(T)
    figure(5); clf; hold on; box on;
    plot(X(nt,1:10)); 
    set(gca,'ylim', [-2.5,2.5])
    xlabel('Cell');
    ylabel('Voltage')
    drawnow;
end
