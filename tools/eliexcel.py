import sys
import os
import xlrd
import re

# 当前脚本路径
# curpath = os.path.dirname(os.path.abspath(sys.argv[0]))

# data = xlrd.open_workbook("aaa.xlsx")

# table = data.sheets()[0]
# print(table)

# names = data.sheet_names()
# print(names)

# ncols = table.ncols
# print(ncols)

# nrows = table.nrows
# print(nrows)

# print(table.row(0))
tbRobotContinuedList = {}
tbEndTime = {
    "nEndTime":3
}
tbRobotContinuedList["sRoleName"] = {}
tbRobotContinuedList["sRoleName"]["tbEndTime"] = []
tbRobotContinuedList["sRoleName"]["tbEndTime"].append(tbEndTime)
tbRobotContinuedList["sRoleName"]["tbEndTime"].append(tbEndTime)
tbRobotContinuedList["sRoleName"]["tbEndTime"].append(tbEndTime) 

print(tbRobotContinuedList)