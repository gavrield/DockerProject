#! /usr/bin/python3
import time
i = 0
print("Hello form long running progrm")
while i < 100:
  i += 1
  print(i,". Hi from program", file=open("/data/out.txt", "a"))
  time.sleep(2)
