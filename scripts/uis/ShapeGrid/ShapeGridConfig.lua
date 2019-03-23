local ShapeGridConfig = 
{
    bVisible = true,
    bEnabled = true,
    nItemID = 0,
    x = 300;
    y = 100;
    w = 70;
    h = 50;
    bAutoPos = false,
    style = {
        bBg = true,
        bBorder = true,
        sborderFill = "line",
        sbgFill = "fill",
        nFontSize = 182,
        bgcolor = {0.3,0.3,1,1},
        txtcolor = {1,1,1,1},
        bordercolor = {0,0,0,1},
        bHoverColor = {0.5,0.5,1,1},
    };
    sText = "按钮",
    onClick = nil, -- 点击
    onHover = nil, -- 滑入
    bHover = false, -- 是否滑入
    bHoverMove = false, -- 是否滑入移动
    bShowHover = true, 
    nLayerIndex = 1, -- 渲染层级
    sStencilAction = "replace", -- 模具函数如何修改所接触像素的模具值。
    nCol = 1; -- 不可修改，必须为1
    nRow = 1; -- 不可修改，必须为1
    nLength = 4; -- 单行长度
    nSpace = 3; -- 间隔
    nCellWidth = 100; -- 
    nCellHeight = 100;
}
return ShapeGridConfig