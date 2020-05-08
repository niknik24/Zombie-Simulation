clc;
close all;
clear all;

global total_citizens simulation_length...
    transmission_rate degradation_rate death_rate...
    zmbPower transmission_radius start_button edit_zmb1 edit_zmb2...
    edit_zmb3 zmb1 zmb2 zmb3 result
total_citizens = 150;
simulation_length = 50;
transmission_rate = 1;
degradation_rate = 0.4;
death_rate = 0.01;
transmission_radius = 75;
zmbPower = [ 0.4 0.8; 0.3 0.6; 0.2 0.5];
zmb1=3; zmb2=0; zmb3=0;

f = figure('Visible', 'off', 'Position', [360, 500, 720, 480]);
left_ui_position = 500;

uicontrol('Style', 'text', 'String', 'Start Configuration',...
    'Position', [left_ui_position, 445, 160, 23],...
    'FontSize', 14);

start_button = uicontrol('Style', 'pushbutton',...
    'String', 'Start Simulation','FontSize',11,...
    'Position', [left_ui_position, 40, 160, 20],...
    'Callback', {@start_simulation_callback});

uicontrol('Style', 'text', 'String', 'Number of Citizens',...
    'Position', [left_ui_position, 400, 160, 20],...
    'FontSize', 12);

uicontrol('Style', 'edit', 'String', total_citizens,...
'Position', [left_ui_position, 380, 160, 20],'FontSize', 12,...
'Callback', {@change_tc_callback});

uicontrol('Style', 'text', 'String', '1 lvl Zombies',...
    'Position', [left_ui_position, 350, 160, 20],...
    'FontSize', 12,'HorizontalAlignment', 'Left');

ch1_button = uicontrol('Style','checkbox','Position',[left_ui_position+100, 350, 160, 20],...
    'Callback', {@change_ch1_callback},'Value',1);

edit_zmb1 = uicontrol('Style','edit','String', zmb1,'Position',[left_ui_position+130, 350, 60, 20],...
    'FontSize',10,'Callback', {@change_zmb1_callback});

uicontrol('Style', 'text', 'String', '2 lvl Zombies',...
    'Position', [left_ui_position, 320, 160, 20],...
    'FontSize', 12,'HorizontalAlignment', 'Left');

ch2_button = uicontrol('Style','checkbox','Position',[left_ui_position+100, 320, 160, 20],...
    'Callback', {@change_ch2_callback});

edit_zmb2 = uicontrol('Style','edit','String', zmb2,'Position',[left_ui_position+130, 320, 60, 20],...
    'Visible','off','FontSize',10,'Callback', {@change_zmb2_callback});

uicontrol('Style', 'text', 'String', '3 lvl Zombies',...
    'Position', [left_ui_position, 290, 160, 20],...
    'FontSize', 12,'HorizontalAlignment', 'Left');

ch3_button = uicontrol('Style','checkbox','Position',[left_ui_position+100, 290, 160, 20],...
    'Callback', {@change_ch3_callback});

edit_zmb3 = uicontrol('Style','edit','String', zmb3,'Position',[left_ui_position+130, 290, 60, 20],...
    'Visible','off','FontSize',10,'Callback', {@change_zmb3_callback});

result = uicontrol('Style', 'text', 'String', {},...
    'Position', [left_ui_position, 100, 160, 90],...
'FontSize', 12, 'HorizontalAlignment', 'Left');

ha = axes('Units', 'pixels', 'Position', [50, 50, 400, 400]);
set(f, 'Name', 'Zombie Simulation');
movegui(f, 'center');
set(f, 'Visible', 'on'); 

function start_simulation_callback(~, ~)   
    global total_citizens simulation_length...
    transmission_rate degradation_rate death_rate...
    zmbPower transmission_radius start_button zmb1 zmb2 zmb3 result
    set(start_button,'String','Restart Simulation');    
    result.String=run_simulation(total_citizens, simulation_length,...
    transmission_rate, degradation_rate, death_rate,...
    zmbPower, transmission_radius, zmb1,zmb2,zmb3);
end

function change_tc_callback(source, ~)   
    global total_citizens 
    total_citizens =  round(str2double(source.String));
end

function change_ch1_callback(source,~)
    global edit_zmb1 zmb1
    if source.Value==1
        set(edit_zmb1,'Visible','on');
    else
        set(edit_zmb1,'Visible','off');
        zmb1=0;
        set(edit_zmb1,'String',zmb1);
    end    
end   

function change_ch2_callback(source,~)
    global edit_zmb2 zmb2
    if source.Value==1
        set(edit_zmb2,'Visible','on');
    else
        set(edit_zmb2,'Visible','off');
        zmb2=0;
        set(edit_zmb2,'String',zmb2);
    end    
end   

function change_ch3_callback(source,~)
    global edit_zmb3 zmb3
    if source.Value==1
        set(edit_zmb3,'Visible','on');
    else
        set(edit_zmb3,'Visible','off');
        zmb3=0;
        set(edit_zmb3,'String',zmb3);
    end    
end 

function change_zmb1_callback(source,~)
    global zmb1
    zmb1=round(str2double(source.String));
end   

function change_zmb2_callback(source,~)
    global zmb2
    zmb2=round(str2double(source.String));
end  

function change_zmb3_callback(source,~)
    global zmb3
    zmb3=round(str2double(source.String));
end  


