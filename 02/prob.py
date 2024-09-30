i = 1
j = 1
total = 0
while True:
    oldj = j
    j += i
    if j < 100:
        print(j)
    if j > 4000000:
        break
    if j & 1 == 0:
        total += j
    i = oldj
print(total)
