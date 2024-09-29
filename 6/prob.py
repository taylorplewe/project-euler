sum_prod = 0
prod_sum = 0

for i in range(101):
    sum_prod += (i * i)
    prod_sum += i
prod_sum *= prod_sum

print(prod_sum - sum_prod)

