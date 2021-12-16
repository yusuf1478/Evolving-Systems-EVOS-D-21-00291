function [x,resnorm,residual,exitflag,output,lambda,jacobian] = LMcode_new(x0,OptimalityTolerance_Data,StepTolerance_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('lsqnonlin');
%% Modify options setting
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'OptimalityTolerance', OptimalityTolerance_Data);
options = optimoptions(options,'FunctionTolerance', OptimalityTolerance_Data);
options = optimoptions(options,'StepTolerance', StepTolerance_Data);
options = optimoptions(options,'Algorithm', 'levenberg-marquardt');
options = optimoptions(options,'ScaleProblem', 'jacobian');
[x,resnorm,residual,exitflag,output,lambda,jacobian] = ...
lsqnonlin(@LMnew,x0,[],[],options);
