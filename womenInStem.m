function [] = womenInStem ()
global stem;

stem.fig=figure(); %creats a figure for the information to be graphed in 
stem.p=plot(0,0);
stem.p.Parent.Position=[0.25 0.25 0.7 0.7];

stem.buttonGroup=uibuttongroup('visible','on','units','normalized','position',[0 0.4 .15 .25],'selectionchangefcn',{@buttonBox}); %creats the callback functions for the buttons, UI1
stem.b1=uicontrol(stem.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .7 1 .2],'HandleVisibility','off','string','Science'); %creats different buttons and names them
stem.b2=uicontrol(stem.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .5 1 .2],'HandleVisibility','off','string','Technology');
stem.b3=uicontrol(stem.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .3 1 .2],'HandleVisibility','off','string','Engineering');
stem.b4=uicontrol(stem.buttonGroup,'style','radiobutton','units','normalized','position',[.1 .1 1 .2],'HandleVisibility','off','string','Mathmatics');

stem.scroll=uicontrol('style','slider','units','normalized','position',[0.25 0.1 0.6 0.05],'value',1,'min',1,'max',2,'sliderstep',[1/1 1/1],'callback',{@scroll}); %creats the scroll bar at the bottom of the graph,UI2
scroll();

stem.Message=uicontrol('style','text','units','normalized','position', [0 .65 .1 .1],'string','STEM subgroups','horizontalalignment','right'); %Titile to the button box, UI3
end

function []=buttonBox (~,~) %this function allows the user to switch between the graphs
    global stem;
    type=stem.buttonGroup.SelectedObject.String;
    plotSelectedOccupation(type);
end

function []= scroll (~,~) % this function allows the user to witch between the graphs controlled by the slider bar
    global stem;
    stem.scroll.Value=round(stem.scroll.Value);
    type=stem.buttonGroup.SelectedObject.String;
    plotSelectedOccupation(type);
end

function [] = plotSelectedOccupation(type)

global stem;
%the lines below create the values to be ploted
D=[1970 1980 1990 2000 2010 2019]; %Decades
S=[7 14 23 25 27 27]; %Stem as a whole
Sc=[17 36 51 48 56 61]; %Science
Te=[15 26 34 30 27 26]; %Technology
Ee=[3 8 12 12 14 15]; %Engineering
Ma=[15 36 41 44 47 47]; %MAthmatics

overallSTEM=stem.scroll.Value;
overallSTEM==S;

    if strcmp(type,'Science')  %creats a plot on the graph of the different buttoms
        stem.p=plot(D,Sc,'b-');
    elseif strcmp(type,'Technology')
        stem.p=plot(D,Te,'r-');
    elseif strcmp (type,'Engineering')
        stem.p=plot(D,Ee,'g-');
    else
        strcmp (type,'Mathmatics')
        stem.p=plot(D,Ma,'m-');
    end
    
switch overallSTEM %creates the grpahs for the slider bar
     case 1
        overallSTEM = 'Clear';
     case 2 
        overallSTEM = 'Overall Women in STEM Percentage';
        hold on
        stem.p=plot(D,S,'c-'); 
        hold off
end

title('Women in STEM'); 
xlabel('Decade');
ylabel('Perscentage of women in STEM subfeild');
ytickformat('percentage')
ylim([0 100]);
end
