# -*- coding:utf-8 -*-

import sys,os
import json

#创建场景
def CreateScene(nSceneID):
    # print(nSceneID)
    sDir = "scripts/scenes"
    sDirName = f"Scene{nSceneID}"
    sFileSys = f"Scene{nSceneID}.lua"
    sFileCfg = f"Scene_{nSceneID}.lua"

    sFileSysName = f"{sDir}/{sDirName}/{sFileSys}"
    sFileCfgName = f"{sDir}/{sDirName}/{sFileCfg}"

    sSysContent = (
    f"_G.Scene{nSceneID} = GameChainSystem:DeriveClass('Scene{nSceneID}');\n\n"
    f"function Scene{nSceneID}:StartHandler()\n"
    "\n"
    "end\n"
    "\n"
    f"function Scene{nSceneID}:DestoryHandler()\n"
    "\n"
    "end")
    

    sCfgContent = (
        f"_G.Scene_{nSceneID} = \n"
        "{\n"
        "    tbActor = \n"
        "    {\n"
        "        { sActorType = 'Player', sUseName = 'Player1' },\n"
        "    };\n"
        "\n"
        "    tbUI = \n"
        "    { \n"
        "        -- { sUIType = 'ShapeButton', sUseName = 'btn_1' },\n"
        "    },\n"
        "\n"
        "    tbSystem = \n"
        "    {\n"
        f"        'Scene{nSceneID}',\n"
        "    };\n"
        "}"
    )
   
    sPath = f"{sDir}/{sDirName}"
    if os.path.exists(sPath) :
        print("该场景已存在！")
        return
    else:
        os.mkdir(sPath)

    f = open(sFileSysName,"x")
    f.write(sSysContent)
    f.close()

    f = open(sFileCfgName,"x")
    f.write(sCfgContent)
    f.close()

    jsonFile = "configs/gamecfgs/GameDataCfg.json"
    f = open(jsonFile,"r",encoding='utf-8') 
    fileJson = json.load(f)
    f.close() 

    # nMaxSceneCount = fileJson["GameDataCfg"]["nMaxSceneCount"]

    # if nMaxSceneCount < int(nSceneID):
    fileJson["GameDataCfg"]["nMaxSceneCount"] = nSceneID

    f = open(jsonFile,"w")
    f.write(json.dumps(fileJson))
    f.close()

    pass

#删除场景
def DeleteScene(nSceneID):

    sDir = "scripts/scenes"
    sDirName = f"Scene{nSceneID}"

    sPath = f"{sDir}/{sDirName}"
    if not os.path.exists(sPath) :
        print("该场景不存在！")
        return
    else:
        for root, dirs, files in os.walk(sPath, topdown=False):
            for name in files:
                os.remove(os.path.join(root, name))
            for name in dirs:
                os.rmdir(os.path.join(root, name))

        os.rmdir(sPath) 
    pass

#创建Actor
def CreateActor():
    pass

#删除Actor
def DeleteActor():
    pass

#创建组件
def CreateCompo():
    pass

#删除组件
def DeleteCompo():
    pass

#创建公共系统
def CreateCommonSystem():
    pass

#删除公共系统
def DeleteCommonSystem():
    pass

#创建自定义系统
def CreateMySystem():
    pass

#删除自定义系统
def DeleteMySystem():
    pass

#查询场景数量
def QuerySceneCount():
    nCount = 0
    sDir = "scripts/scenes"
    for _, dirs, _ in os.walk(sDir, topdown=False):
        for _ in dirs:
            nCount += 1
    return nCount

#查询当前场景名称
def QuerySceneName():
    tbSceneName = []
    sDir = "scripts/scenes"
    for _, dirs, _ in os.walk(sDir, topdown=False):
        for name in dirs:
            tbSceneName.append(name)
    return tbSceneName


if __name__=="__main__":
 
    # eli scene -c 5 ：创建ID为5的场景
    # eli scene -d 5 : 删除ID为5的场景
    # eli q scene -a : 查询当前场景总数
    # eli q scene -b : 查询当前场景名称

    # cmdName = sys.argv[0]
    cmdName = sys.argv[1]
    if cmdName == "scene" :
        sOper = sys.argv[2]
        if sOper == "-c": # create
            nSceneID = sys.argv[3]
            CreateScene(nSceneID)
        elif sOper == "-d": # delete
            nSceneID = sys.argv[3]
            DeleteScene(nSceneID)
        else:
            print("请输入正确的命令！")
            pass
    elif cmdName == "actor" :
        pass
    elif cmdName == "compo" :
        pass
    elif cmdName == "cosys" :
        pass
    elif cmdName == "mysys" :
        pass
    elif cmdName == "q" :
        if sys.argv[2] == "scene":
            if sys.argv[3] == "-a": #查询当前场景数量
                nSceneCount = QuerySceneCount()
                print(f"场景数量：{nSceneCount}")
            elif sys.argv[3] == "-b": #查询当前场景名称
                tbSceneName = QuerySceneName()
                print(f"场景名称列表：{tbSceneName}")
        pass
    else:
        pass
        