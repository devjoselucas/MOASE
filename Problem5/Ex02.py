# -*- coding: utf-8 -*-
"""
Created on Tue Sep 21 16:26:42 2021

@author: José Lucas Damasceno
"""


import cvxpy as cp

# Create two scalar optimization variables.
x = cp.Variable(5)
p = [2, 1, 4, 5, 3]
l = [79, 17, 187, 245, 140]


# Create two constraints.
constraints = [x[:] >= 0,
               x[:] <= 10,
               x[1]*p[1] + x[2]*p[2] + x[3]*p[3] + 
               x[4]*p[4] + x[0]*p[0] <= 10 ]

# Form objective.
obj = cp.Maximize(x[1]*l[1] + x[2]*l[2] + x[3]*l[3] + 
                  x[4]*l[4] + x[0]*l[0])

# Form and solve problem.
prob = cp.Problem(obj, constraints)
prob.solve()  # Returns the optimal value.
print("Status: ", prob.status)
print("Valor otimizado: ", round(prob.value))

x = x.value

print("Quantidades por produto: \n",
                                  round(x[0]),
                             "\n",round(x[1]),
                             "\n",round(x[2]),
                             "\n",round(x[3]),
                             "\n",round(x[4]))