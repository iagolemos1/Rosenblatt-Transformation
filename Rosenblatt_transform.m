function [obj_normal] = Rosenblatt_transform(obj_dist, x)
%% Rosenblatt transformation - Nonnormal distribution to normal distribution
%{
---------------------------------------------------------------------------
Created by: Iago Pereira Lemos (lemosiago123@gmail.com)
Federal University of Uberlândia, School of mechanical engineering
---------------------------------------------------------------------------
Inputs
obj_dist: Distribution object nonnormal made with makedist or fitdist
x: target variable value of transformation

Outputs
obj_normal: Equivalent normal distribution object
%}

sigma_N = normpdf(norminv(cdf(obj_dist, x)))/(pdf(obj_dist, x)); %computing std
mean_N  = x - norminv(cdf(obj_dist, x))*sigma_N;                 %computing mean

obj_normal = makedist('Normal', 'mu', mean_N, 'sigma', sigma_N); %creating normal distribution object

return