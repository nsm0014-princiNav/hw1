%% Formatting
clc
clear
close all
format shortg
%% Begin Question 5
t = linspace(0,100,1000);
b = 3;
sigma = 1;
mean = 0;
[gaussianDistVector] = gaussianDistFCN([1 1],sigma,mean);

a = zeros(100,length(t));
v = zeros(100,length(t));
p = zeros(100,length(t));
a(1,1) = b + gaussianDistVector(1);
for i = 1:100
    dt = 0.1;
    [gaussianDistVector] = gaussianDistFCN([1 1],sigma,mean);
    for k = 2:length(t)
        a(i,k) = a(1) + b + gaussianDistVector;
        v(i,k) = v(i,k-1) + a(i,k-1)*dt;
        p(i,k) = p(i,k-1) + v(i,k-1)*dt + 0.5*a(i,k-1)*dt*dt;
  
    end

end

velo_var = var(v,0,1);
pos_var = var(p,0,1);

fig1 = figure('Position',[500 500 800 400]);
tiledlayout(2,1)
nexttile
xlabel('Time [s]','FontSize',16)
ylabel('Variance','FontSize',16)
hold on
plot(t,velo_var,LineWidth=2)

nexttile
xlabel('Time [s]','FontSize',16)
ylabel('Variance','FontSize',16)
hold on
plot(t,pos_var,LineWidth=2)
saveas(fig1,'Q5.png')
