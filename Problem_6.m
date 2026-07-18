close all; clear; clc;
import casadi.*;

%Create Symbolic Variables
x = SX.sym('x',3);

%Initial condition
x0bar = [0; 0; 0];

%Objective
L = @(x) [0.5*[(x(1)^2 + x(2)^2 + x(3)^2)];
Obj = L(x);

g = [x(1) + x(2) + x(3) + 3; x(1)];

decision_variable = x;

%NLP solver
nlp = struct('x',x,'f',L);
opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.acceptable_tol = 1e-8;

solver = nlpsol('solver','ipopt',nlp,opts);

lbx = [-inf; inf];
ubx = [inf; inf];
lbg = [-inf;-inf];
ubg = [0;0];
sol = solver('x0',x0bar,'lbx',lbx,'ubx',ubx,'lbg',lbg,'ubg',ubg);

%Optimal X values is
x_sol = full(sol.x)

%Optimal function value is
f_min = full(sol.f)
