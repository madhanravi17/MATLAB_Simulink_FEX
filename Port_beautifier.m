function Port_beautifier(Model, SubSystem)
%%%%%%%%%%%%%%%%%
% Author :  Madhan Ravi
% Example: Port_beautifier('Simulink_Programming', 'sd')
%%%%%%%%%%%%%%%%%

%% Aligning ports (Ports Abstimmung) Inports
h1 = get_param(fullfile(Model, SubSystem), 'PortConnectivity'); 
for k = 1 : numel(h1)
    if nnz(h1(k).SrcBlock)
        n = get_param(h1(k).SrcBlock,'Name');
        pos = get_param(fullfile(Model, n), 'position');
        HeighT = (-pos(2)+pos(4))/2;
        WidtH = (-pos(1)+pos(3))/2;        
        pos(1:2:4) = h1(k).Position(1) + [-WidtH-100, WidtH-100]; %100 spacing between port and SubSystem
        pos(2:2:4) = [h1(k).Position(2)-HeighT, h1(k).Position(2)+HeighT];
        set_param(fullfile(Model, n), 'Position',pos)
    else continue
    end
end
%% Aligning ports (Ports Abstimmung) Outports
h1 = get_param(fullfile(Model, SubSystem), 'PortConnectivity');
for k = 1 : numel(h1)
    if nnz(h1(k).DstBlock)
        n = get_param(h1(k).DstBlock,'Name');
        pos = get_param(fullfile(Model, n), 'position');
        HeighT = (-pos(2)+pos(4))/2;
        WidtH = (-pos(1)+pos(3))/2;        
        pos(1:2:4) = h1(k).Position(1) + [-WidtH+100, WidtH+100]; %100 spacing between port and SubSystem
        pos(2:2:4) = [h1(k).Position(2)-HeighT, h1(k).Position(2)+HeighT];
        set_param(fullfile(Model, n), 'Position',pos)
    else continue
    end
end
end