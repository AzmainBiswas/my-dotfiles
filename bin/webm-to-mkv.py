#!/usr/bin/env python3

import os


def prCyan(skk):
    print("\033[96m {}\033[00m".format(skk))


for file in os.listdir():
    name, ext = os.path.splitext(file)
    if ext == ".mkv":
        os.system(f"ffmpeg -i {name}.mkv -c:v copy -c:a copy {name}.mp4")
        prCyan(f"complete {name}.mp")
