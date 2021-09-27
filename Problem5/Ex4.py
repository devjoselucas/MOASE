# -*- coding: utf-8 -*-
"""
Created on Mon Sep 27 08:40:37 2021

@author: José Lucas Damasceno
"""

# Python3 program to find maximum
# achievable value with a knapsack
# of weight W and multiple instances allowed.
# Returns the maximum value with knapsack of W capacity
# This code is contributed by Anant Agarwal.

def unboundedKnapsack(W, val, wt):
    # dp[i] is going to store maximum value with knapsack capacity i.
    n = len(val)
    dp = [0 for i in range(W + 1)]
    
    # Fill dp[] using above recursive formula
    for i in range(W + 1):
        for j in range(n):
            if (wt[j] <= i):
                dp[i] = max(dp[i], dp[i - wt[j]] + val[j])
                    
    return dp[W]

# Driver program
W = 10
wt = [2, 1, 4, 5, 3]
val = [79, 17, 187, 245, 140]
print(unboundedKnapsack(W, val, wt))