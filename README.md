# CasADi Constrained Optimization Problem

This repository contains a MATLAB script that implements and solves a constrained **Non-Linear Programming** (NLP) optimization problem using the **CasADi** framework and the **IPOPT** solver.

## Problem Description

The objective is to find a 3-dimensional vector $x = [x_1, x_2, x_3]^T$ that minimizes the squared distance from the origin (the squared Euclidean norm) while strictly satisfying a linear plane constraint. 

### Mathematical Formulation

$$
\begin{aligned}
\min_{x_1, x_2, x_3} \quad & f(x) = x_1^2 + x_2^2 + x_3^2 \\
\text{subject to} \quad & x_1 + x_2 + x_3 = 10
\end{aligned}
$$

* **Decision Variables**: $x_1, x_2, x_3 \in \mathbb{R}$ (unbounded internally with lower/upper bounds set to $\pm\infty$).
* **Objective Function**: Minimize $f(x)$, representing the sum of squares of the decision variables.
* **Constraints**: A single linear equality constraint ($g(x) = 10$) enforced by setting both the lower bound (`lbg`) and upper bound (`ubg`) of the constraint function to 10.

## Implementation Details

The script utilizes the following configurations for the **IPOPT** solver:
* **Maximum Iterations**: `1000`
* **Acceptable Tolerance**: `1e-8`
* **Print Level**: `0` (silent execution)

## Prerequisites

To run this script, you must have:
1. **MATLAB** installed.
2. The **CasADi** optimization framework downloaded and added to your MATLAB search path.

## Usage

1. Clone or download this repository.
2. Open the script in MATLAB.
3. Ensure CasADi is in your path, then run the script to output the optimal decision variable coordinates (`x_sol`) and the minimized objective value (`min_value`).
