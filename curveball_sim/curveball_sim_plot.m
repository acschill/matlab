%description
function [] = curveball_sim_plot(x,y,z)

    hold on;
    title('Sidearm curve ball');

%     %y vertical deflection line styling
%     noWindLine = plot(x,y,'black');
%     noWindLine.LineStyle = ':';
% 
%     %z horizontal deflection line styling
%     tailwindLine = plot(x,z,'blue');
%     tailwindLine.LineStyle = '-';
    
    %plot data
    plot(x,y,'black:',x,z,'blue-');
    
    %graph details
    axis([-10 70 -4 4]);
    xlabel('x (feet)')
    ylabel('y or z (feet)')
    xticks(0:20:60);
    yticks(-4:2:4);
    box on

    %vertical line 1
    XL1 = 0;
    L1 = line([XL1,XL1],[-3,3.5]);
    L1.LineStyle = '--';
    
    %vertical line 2
    XL2 = 60;
    L2 = line([XL2,XL2],[-3,3.5]);
    L2.LineStyle = '--';
    
%     %no wind arrow
%     x = [0.8 0.715];
%     y = [0.475 0.4];
%     annotation('textarrow',x,y,'String','no wind')
% 
%     %tailwind arrow
%     x = [0.765 0.715];
%     y = [0.7 0.6];
%     annotation('textarrow',x,y,'String','tailwind')
% 
%     %headwind arrow
%     x = [0.5 0.585];
%     y = [0.35 0.445];
%     annotation('textarrow',x,y,'String','headwind')

    hold off;

end

