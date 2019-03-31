local BlueEnemyConfig = 
{
    ['Transform'] = { x=100, y=100, w=64, h=64 };
    ['Color'] = { r = 0, g = 0, b = 1, a = 1 };
    ['RenderLayer'] = { nLayerIndex = RenderLayerType.nPlayer };
    ['Rectangle'] = { sFillType = 'fill'}; 
    ['Hate'] = { }; 
    ['StateMachine'] = { sCurrentState = 'Hold',tbStates= { 'Hold','Attack','Def' }}; 
}
return BlueEnemyConfig
