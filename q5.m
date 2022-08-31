%% Formatting
clc
clear
close all
format shortg
%% Begin Question 5
t = linspace(0,100,1000);
b = 3;
sigma = 1;
mean_q5 = 0;
[gaussianDistVector] = gaussianDistFCN([100 1],sigma,mean_q5);
a = zeros(100,length(t));
a(:,1) = b + gaussianDistVector;
v = zeros(100,length(t));
p = zeros(100,length(t));


dt = 0.1;
for i = 1:100

    for k = 2:length(t)

        [gaussianDistVector] = gaussianDistFCN([1 1],sigma,mean_q5);
        a(i,k) = b + gaussianDistVector;
        v(i,k) = v(i,k-1) + a(i,k-1)*dt;
        p(i,k) = p(i,k-1) + v(i,k-1)*dt + 0.5*a(i,k-1)*dt*dt;

    end

end

velo_var = var(v,0,1);
pos_var = var(p,0,1);
mean_accel = (mean(a,2));
super_mean_accel = mean(mean_accel);
var_mean_accel = var(mean_accel);

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

fig1 = figure('Position',[500 500 800 400]);
xlabel('Simulations','FontSize',16)
ylabel('Estimated Bias','FontSize',16)
hold on
plot(1:100,mean_accel)
saveas(fig1,'Q6b.png')