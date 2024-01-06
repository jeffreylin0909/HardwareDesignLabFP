import os
import subprocess
import time

L = os.listdir()

for fn in L:
    if (fn[-4:] == '.png'):
        print(fn)
        p = subprocess.Popen('PicTrans.exe', stdout = subprocess.PIPE, stdin = subprocess.PIPE, stderr = subprocess.PIPE, shell = True)
        p.stdin.write('20\n'.encode())
        p.stdin.flush()
        p.stdin.write('20\n'.encode())
        p.stdin.flush()
        p.stdin.write((fn+'\n').encode())
        p.stdin.flush()
        time.sleep(1)
        os.rename('out.coe',(fn[:-4]+'.coe'))