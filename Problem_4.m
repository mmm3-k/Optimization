close all; clear; clc;
import casadi.*;

%Create Symbolic Variables
x = SX.sym('x',1);

%Initial condition
x0bar = [1/sqrt(1.2)];

%Objective
L = @(x) [x^4 - x^2]
Obj = L(x);

decision_variable = x;

%NLP solver
nlp = struct('x',x,'f',L);
opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.acceptable_tol = 1e-8;

solver = nlpsol('solver','ipopt',nlp,opts);
sol = solver('x0',x0bar);

%Optimal X values is
x_sol = full(sol.x)

%Optimal function value is
f_min = full(sol.f)
