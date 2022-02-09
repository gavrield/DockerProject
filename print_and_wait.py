#! /usr/bin/python3
import time
i = 0
while i < 100:
  i += 1
  print(i,". Hi from long time program", file=open("/data/out.txt", "a"))
  time.sleep(2)
