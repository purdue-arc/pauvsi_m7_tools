function [C, tf] = polynomialTrajectorySolver(X, Y, Z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   This will solve for the coefficients of a constrained 9 order
%   polynomial

%declare ti as zero
ti = 0;
%this is a ball park estimate of tf for starting
%in the future it should take into account the distance
tf = 10;

A = get9DegPolyMatrix(ti, tf);

%solve for the coefficient matrix
C = zeros(3, 10);
C(1, :) = inv(A)*X';
C(2, :) = inv(A)*Y';
C(3, :) = inv(A)*Z';

%now that we have the Coefficient matrix run the calculate Actuator
%feasibility function
Error = calculateActuatorFeasibility(C, 5, [1, 1, 1]', 10, 100, pi/6, tf);


end

