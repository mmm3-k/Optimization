clear all; clear; clc;
import casadi.*;

%Create symbolic variables
x = SX.sym('x',3);

% Initial condition
x0bar = [0; 0; 0];

%Objective
L = @(x) (x(1) - 3)^2 + (x(2)-2)^2 ;
obj = L(x);

g = [x(1)^2 - x(2) -3; x(2)-1];

decision_variable = x;

%Create NLP solver
nlp = struct('x',decision_variable,'f',obj,,'g',g);
opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0;
opts.ipopt.acceptable_tol = 1e-8;

solver = nlpsol('solver','ipopt',nlp,opts);

lbx = [0; -inf];
ubx = [inf; inf];
lbg = [-inf; -inf];
ubg = [0; 0];
sol = solver('x0',x0bar,'lbx', lbx, 'ubx', ubx, 'lbg', lbg,'ubg', ubg);

%Optimal X values are
x_sol = full(sol.x);

%Optimal Objective value is 
min_value = full(sol.f);

