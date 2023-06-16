#!/usr/bin/env python3

import os

for file in os.listdir():
    Name, Ext = os.path.splitext(file)
    un_dash_names = Name.split("｜")
    un_dash_name_join = "".join(un_dash_names)
    un_space_names = un_dash_name_join.split(" ")
    un_space_name_join = "-".join(un_space_names)
    un_underscore_names = un_space_name_join.split("_")
    un_underscore_name_join = "-".join(un_underscore_names)
    NewName = f"{un_underscore_name_join}{Ext}"
    os.rename(file, NewName)

for file in os.listdir():
    print(file)

