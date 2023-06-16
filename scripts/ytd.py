#!/usr/bin/env python3
import sys, os

def LinkAndName():
    YTlink = sys.argv[1]
    Vnmae = sys.argv[2:]
    VnameJoint = '-'.join(Vnmae)
    VnameSmall = VnameJoint.lower()
    return YTlink, VnameSmall

YTlink, VideoNmae = LinkAndName()
os.system(f'yt-dlp {YTlink} -o {VideoNmae}')
