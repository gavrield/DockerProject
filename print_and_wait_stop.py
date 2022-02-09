#! /usr/bin/python3
import time
i = 0
while i < 2:
  i += 1
  print(i,". Hi from program", file=open("/data/out.txt", "a"))
  time.sleep(2)
  
