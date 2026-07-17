clear all; clear; clc;
import casadi.*;

%Symbolic variables
x = SX.sym('x',3);

% Initial condition
x0bar = [0; 0; 0];

%Objective
L = @(x) (x(1)^2 + x(2)^2 + x(3)^2);
obj = L(x);

g = x(1) + x(2) + x(3);

decision_variable = x;

%Create NLP solver
nlp = struct('x',decision_variable,'f',obj,'g',g);
opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0;
opts.ipopt.acceptable_tol = 1e-8;

lbx = [-inf; -inf; -inf];
ubx = [inf; inf; inf];
lbg = [10];
ubg = [10];

solver = nlpsol('solver','ipopt',nlp,opts);
sol = solver('x0',x0bar,'lbx', lbx, 'ubx', ubx, 'lbg', ubg,'ubg', lbg);

%Optimal X values are
x_sol = full(sol.x);

%Optimal Objective value is 
min_value = full(sol.f);

