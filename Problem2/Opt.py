
import cvxpy as cp



# Create two scalar optimization variables.
x = cp.Variable(integer=True)
y = cp.Variable(integer=True)


# Create two constraints.
constraints = [x + 10*y <= 100,
               10*x + 3*y <= 100,
               x >= 0,
               y >= 0]

# Form objective.
obj = cp.Maximize(x + 8*y + 10)

# Form and solve problem.
prob = cp.Problem(obj, constraints)
prob.solve(solver='ECOS_BB')  # Returns the optimal value.
print("status:", prob.status)
print("Valor da maximização do PPI: ", prob.value)
print("X = ", x.value)
print("Y = ", y.value)

# Create two scalar optimization variables.
x = cp.Variable(integer=False)
y = cp.Variable(integer=False)


# Create two constraints.
constraints = [x + 10*y <= 100,
               10*x + 3*y <= 100,
               x >= 0,
               y >= 0]

# Form objective.
obj = cp.Maximize(x + 8*y + 10)

# Form and solve problem.
prob = cp.Problem(obj, constraints)
prob.solve(solver='ECOS_BB')  # Returns the optimal value.
print("status:", prob.status)
print("Valor da maximização do PPL: ", prob.value)
print("X = ", x.value)
print("Y = ", y.value)
