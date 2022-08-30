%Project Phosphorylation-Dephosphorylation
kona = 10;
koni = 10;
koffa = 10;
koffi = 10;
kcati = 10;
kcata = 100;
%initial condition: i = k = p = 1, a = 0
% f = d[A]/dt, g = d[AP]/dt, h = d[I]/dt, j = d[IK]/dt
% a = [A], b = [AP], c = [I], d = [IK]
% p = [Ptot] = 1, k = [Ktot] = 1
ptot = 1;
ktot = 1;
f =@(a,b,c,d) -kona*(ptot-b)*a + koffa*b + kcata*d;
g =@(a,b,c,d) kona*(ptot-b)*a - koffa*b - kcati*b;
h =@(a,b,c,d) -koni*(ktot-d)*c + koffi*d + kcati*b;
j =@(a,b,c,d) koni*(ktot-d)*c - koffi*d - kcata*d;

dxdt = @(t,x)[f(x(1),x(2),x(3),x(4));
              g(x(1),x(2),x(3),x(4));
              h(x(1),x(2),x(3),x(4));
              j(x(1),x(2),x(3),x(4))];

[T, X] = ode45(dxdt, [0,15], [0.0,0.0,1.0,0.0] ); 

figure; hold on;
plot(T,X(:,1),'-r'); % red for d[A]/dt
plot(T,X(:,2),'-b'); % blue for d[AP]/dt
plot(T,X(:,3),'-g'); % green for d[I]/dt
plot(T,X(:,4),'-k'); % black for d[IK]/dt
ylabel('Molecular concentration (micromolar)')
xlabel('Time (hours)')
%-----------------------part e
kona = 10;
koni = 10;
koffa = 10;
koffi = 10;
kcati = 10;
kcata = 100;
%initial condition: i = k = p = 1, a = 0
% f = d[A]/dt, g = d[AP]/dt, h = d[I]/dt, j = d[IK]/dt
% a = [A], b = [AP], c = [I], d = [IK]
% p = [Ptot] = 1, k = [Ktot] = 1
ptot = 1;

figure(2); hold on;
nMax = 100;
x = zeros(1, nMax);
y = zeros(1, nMax);
for ind = 1:nMax
    i = -3 + 5*ind /nMax;
    ktot = 10 ^i;
    f =@(a,b,c,d) -kona*(ptot-b)*a + koffa*b + kcata*d;
    g =@(a,b,c,d) kona*(ptot-b)*a - koffa*b - kcati*b;
    h =@(a,b,c,d) -koni*(ktot-d)*c + koffi*d + kcati*b;
    j =@(a,b,c,d) koni*(ktot-d)*c - koffi*d - kcata*d;
    
    dxdt = @(t,x)[f(x(1),x(2),x(3),x(4));
                  g(x(1),x(2),x(3),x(4));
                  h(x(1),x(2),x(3),x(4));
                  j(x(1),x(2),x(3),x(4))];
    
    [T, X] = ode45(dxdt, [0,15], [0.0,0.0,1.0,0.0] ); 
    x(ind) = ktot;
    y(ind) = X(end,1);
end

plot(x,y);
set(gca, 'Xscale', 'log')

ylabel('steady state value of active protein')
xlabel('log(ktot)')
title('Itot = 1 uM(part e)')
%---------------------------------------------------------part f
kona = 10;
koni = 10;
koffa = 10;
koffi = 10;
kcati = 10;
kcata = 100;
%initial condition: i = k = p = 1, a = 0
% f = d[A]/dt, g = d[AP]/dt, h = d[I]/dt, j = d[IK]/dt
% a = [A], b = [AP], c = [I], d = [IK]
% p = [Ptot] = 1, k = [Ktot] = 1
ptot = 1;

figure(3); hold on;
nMax = 100;
x = zeros(1, nMax);
y = zeros(1, nMax);
for ind = 1:nMax
    i = -3 + 5*ind /nMax;
    ktot = 10 ^i;
    f =@(a,b,c,d) -kona*(ptot-b)*a + koffa*b + kcata*d;
    g =@(a,b,c,d) kona*(ptot-b)*a - koffa*b - kcati*b;
    h =@(a,b,c,d) -koni*(ktot-d)*c + koffi*d + kcati*b;
    j =@(a,b,c,d) koni*(ktot-d)*c - koffi*d - kcata*d;
    
    dxdt = @(t,x)[f(x(1),x(2),x(3),x(4));
                  g(x(1),x(2),x(3),x(4));
                  h(x(1),x(2),x(3),x(4));
                  j(x(1),x(2),x(3),x(4))];
    
    [T, X] = ode45(dxdt, [0,15], [0.0,0.0,100.0,0.0] ); 
    x(ind) = ktot;
    y(ind) = X(end,1);
end

plot(x,y);
set(gca, 'Xscale', 'log')

ylabel('steady state value of active protein')
xlabel('log(ktot)')
title('Itot = 100 uM(part f)')
