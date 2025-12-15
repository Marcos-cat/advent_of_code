from hashlib import md5
from pathlib import Path

input = Path("input.txt").read_text().strip()
print(input)


def zeros(n):
    key = 1
    while True:
        if md5((input + str(key)).encode()).hexdigest()[:n] == "0" * n:
            break
        key += 1
    return key

print(zeros(5))
print(zeros(6))
