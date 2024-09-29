import sys

def sumAllMultsBelowNum(mult1, mult2, high):
    total = 0
    for i in range(mult1, high, mult1):
        total += i
    for i in range(mult2, high, mult2):
        if i % mult1 != 0:
            total += i
    return total

mult1 = 3 if len(sys.argv) < 2 else int(sys.argv[1])
mult2 = 5 if len(sys.argv) < 3 else int(sys.argv[2])
high = 1000 if len(sys.argv) < 4 else int(sys.argv[3])

print(f"mults: {mult1} and {mult2}; high: {high}")
print(sumAllMultsBelowNum(mult1, mult2, high))
