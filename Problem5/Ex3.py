
def solve_knapsack_unbounded_bottomup(profits, weights, capacity):
    n = len(profits)
    # base checks
    if capacity <= 0 or n == 0 or len(weights) != n:
        return 0
    
    dp = [[-1 for _ in range(capacity + 1)] for _ in range(n)]
    # populate the capacity=0 columns
    for i in range(n):
        dp[i][0] = 0
    # process all sub-arrays for all capacities
    for i in range(n):
        for c in range(1, capacity + 1):
            profit1, profit2 = 0, 0
            if weights[i] <= c:
                profit1 = profits[i] + dp[i][c - weights[i]]
            if i > 0:
                profit2 = dp[i - 1][c]
                dp[i][c] = max(profit1, profit2)
                # maximum profit will be in the bottom-right corner.
                print_selected_items(dp, weights, capacity)
    return dp[n - 1][capacity]

def print_selected_items(dp, weights, capacity):
    idxes_list = []
    print("Selected weights are:", end=" ")
    n = len(weights)
    i = n - 1
    while i >= 0 and capacity >= 0:
        if i > 0 and dp[i][capacity] != dp[i - 1][capacity]:
            # include this item
            idxes_list.append(i)
            capacity -= weights[i]
        elif i == 0 and capacity >= weights[i]:
            # include this item
            idxes_list.append(i)
            capacity -= weights[i]
        else:
            i -= 1
    weights = [weights[idx] for idx in idxes_list]
    print(weights)
    print("Maximum Profit is:", end=" ")
    return weights

# Driver
profits = [540, 79, 17, 187, 245, 140]
weights = [5, 2, 1, 4, 5, 3]
capacity = 10
maximumProfit = solve_knapsack_unbounded_bottomup(profits, weights,
capacity)
print(maximumProfit)