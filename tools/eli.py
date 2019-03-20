# -*- coding:utf-8 -*-

import sys,os
import json

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

#查询角色总数
def QueryActorCount():
    nCount = 0
    sDir = "scripts/actors"
    for _, dirs, _ in os.walk(sDir, topdown=False):
        for _ in dirs:
            nCount += 1
    return nCount

#查询角色名称
def QueryActorName():
    tbActorName = []
    sDir = "scripts/actors"
    for _, dirs, _ in os.walk(sDir, topdown=False):
        for name in dirs:
            tbActorName.append(name)
    return tbActorName

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
        "        -- { sUIType = 'ShapeTextInput', sUseName = 'input_1' },\n"
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
        jsonFile = "configs/gamecfgs/GameDataCfg.json"
        f = open(jsonFile,"r",encoding='utf-8') 
        fileJson = json.load(f)
        f.close() 
        
        fileJson["GameDataCfg"]["nMaxSceneCount"] = QuerySceneCount()

        f = open(jsonFile,"w")
        f.write(json.dumps(fileJson))
        f.close()
    pass

#创建Actor
def CreateActor(sActorName):
    sDir = "scripts/actors"
    sDirName = f"{sActorName}"
    sFileSys = f"{sActorName}.lua"
    sFileCfg = f"{sActorName}Config.lua"

    sFileSysName = f"{sDir}/{sDirName}/{sFileSys}"
    sFileCfgName = f"{sDir}/{sDirName}/{sFileCfg}"

    sSysContent = (
        f"local {sActorName} = {{}};\n"
        f"function {sActorName}:Create(sClassName)\n"
        "   local obj = Actor:DeriveClass(sClassName);\n"
        "   return obj;\n"
        "end\n"
        f"return {sActorName};\n"
    )
    

    sCfgContent = (
        f"local {sActorName}Config = \n"
        "{\n"
        "    ['Transform'] = { x=100, y=100, w=64, h=64 };\n"
        "    ['Color'] = { r = 1, g = 1, b = 1, a = 1 };\n"
        "    ['RenderLayer'] = { nLayerIndex = RenderLayerType.nPlayer };\n"
        "    ['Rectangle'] = { sFillType = 'fill'}; \n"
        "}\n"
        f"return {sActorName}Config\n"
    )
   
    sPath = f"{sDir}/{sDirName}"
    if os.path.exists(sPath) :
        print("该角色已存在！")
        return
    else:
        os.mkdir(sPath)

    f = open(sFileSysName,"x")
    f.write(sSysContent)
    f.close()

    f = open(sFileCfgName,"x")
    f.write(sCfgContent)
    f.close()
 
    pass

#删除Actor
def DeleteActor(sActorName):
    
    sDir = "scripts/actors"
    sDirName = f"{sActorName}"

    sPath = f"{sDir}/{sDirName}"
    if not os.path.exists(sPath) :
        print("该角色不存在！")
        return
    else:
        for root, dirs, files in os.walk(sPath, topdown=False):
            for name in files:
                os.remove(os.path.join(root, name))
            for name in dirs:
                os.rmdir(os.path.join(root, name))
        os.rmdir(sPath)
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



if __name__=="__main__":
 
    # eli scene -c 5 ：创建ID为5的场景
    # eli scene -d 5 : 删除ID为5的场景
    # eli q scene -a : 查询当前场景总数
    # eli q scene -b : 查询当前场景名称

    str = '''
        eli scene -c 5 ：创建ID为5的场景
        eli scene -d 5 : 删除ID为5的场景
        eli actor -c Actor ：创建名称为Actor的角色
        eli actor -d Actor : 删除名称为Actor的角色
        eli q scene -a : 查询场景总数
        eli q scene -b : 查询场景名称
        eli q actor -a : 查询角色总数
        eli q actor -b : 查询角色名称
        '''
        

    # cmdName = sys.argv[0]
    cmdName = sys.argv[1]
    # if not cmdName:
    #     print("请输入正确的命令，比如：");
    #     print(str)
    #     return 

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
    elif cmdName == "help" :
        print(str) 
    elif cmdName == "actor" :
        sOper = sys.argv[2]
        if sOper == "-c": # create
            sActorName = sys.argv[3]
            CreateActor(sActorName)
        elif sOper == "-d": # delete
            sActorName = sys.argv[3]
            DeleteActor(sActorName)
        else:
            print("请输入正确的命令！")
            pass 
        pass
    elif cmdName == "compo" :
        pass
    elif cmdName == "cosys" :
        pass
    elif cmdName == "mysys" :
        pass
    elif cmdName == "q" :
        if sys.argv[2] == "scene":
            if sys.argv[3] == "-a": #查询场景数量
                nSceneCount = QuerySceneCount()
                print(f"场景数量：{nSceneCount}")
            elif sys.argv[3] == "-b": #查询场景名称
                tbSceneName = QuerySceneName()
                print(f"场景名称列表：{tbSceneName}")
        if sys.argv[2] == "actor":
            if sys.argv[3] == "-a": #查询Actor数量
                nSceneCount = QueryActorCount()
                print(f"Actor数量：{nSceneCount}")
            elif sys.argv[3] == "-b": #查询Actor名称
                tbSceneName = QueryActorName()
                print(f"Actor名称列表：{tbSceneName}")
        pass
    else:
        pass
        