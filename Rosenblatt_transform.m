function [obj_normal] = Rosenblatt_transform(obj_dist, x)
%% Rosenblatt transformation - Nonnormal distribution to normal distribution
%{
MIT License

Copyright (c) 2020 Iago Pereira Lemos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
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
