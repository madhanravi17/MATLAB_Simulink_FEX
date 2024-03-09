%% Aligning ports (Ports Abstimmung) Inports
h1 = get_param('Simulink_Programming/SubSystem', 'PortConnectivity');
for k = 1 : numel(h1)
    if nnz(h1(k).SrcBlock)
        n = get_param(h1(k).SrcBlock,'Name');
        pos = get_param(['Simulink_Programming/', n], 'position');
        HeighT = (-pos(2)+pos(4))/2;
        WidtH = (-pos(1)+pos(3))/2;        
        pos(1:2:4) = h1(k).Position(1) + [-WidtH-100, WidtH-100]; %100 spacing between port and subsytem
        pos(2:2:4) = [h1(k).Position(2)-HeighT, h1(k).Position(2)+HeighT];
        set_param(['Simulink_Programming/', n], 'Position',pos)
    else continue
    end
end
%%Aligning ports (Ports Abstimmung) Outports
h1 = get_param('Simulink_Programming/SubSystem', 'PortConnectivity');
for k = 1 : numel(h1)
    if nnz(h1(k).DstBlock)
        n = get_param(h1(k).DstBlock,'Name');
        pos = get_param(['Simulink_Programming/', n], 'position');
        HeighT = (-pos(2)+pos(4))/2;
        WidtH = (-pos(1)+pos(3))/2;        
        pos(1:2:4) = h1(k).Position(1) + [-WidtH+100, WidtH+100]; %100 spacing between port and subsytem
        pos(2:2:4) = [h1(k).Position(2)-HeighT, h1(k).Position(2)+HeighT];
        set_param(['Simulink_Programming/', n], 'Position',pos)
    else continue
    end
end
