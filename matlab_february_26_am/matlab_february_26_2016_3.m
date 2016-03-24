% modification of prey/hunters example
% 
% now lets say
% y1'(t) = P * y1(t) - p * y1(t)*y2(t) 
% y2'(t) = -R * y2(t) + r * y1(t - k)*y2(t - k)
% with P = 0.3, R = 1, k = 0.1, p=r=0.001
% conditions: 
% y1(0) = 1000
% y2(0) = 1100 
% t belong [0, 50]
%