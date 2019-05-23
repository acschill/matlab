%function that plots the 3 sets of x and y data calculated 
%by the function baseball_calc
function [] = baseball_with_winds_plot(x1, y1, x2, y2, x3, y3)

    hold on;
    t = title('Trajectory of a batted baseball','FontWeight','Normal'); %set title w/o bold
    t.FontName = 'Arial';   %change title font type
    %plot data
    plot(x1, y1, 'black-', x2, y2, 'red-.', x3, y3, 'blue:');
    
    %graph details
    axis([0 150 0 30]);
    xl = xlabel('x (m)');   %x axis title
    xl.FontName = 'Arial';  %change x axis font type
    
    yl = ylabel('y (m)');   %y axis title
    yl.FontName = 'Arial';  %change y axis font type
    yticks(0:10:30);        %specify y axis tick marks
    box on

    %no wind arrow
    x = [0.8 0.715];
    y = [0.475 0.4];
    a = annotation('textarrow',x,y,'String','no wind');
    a.FontName = 'Cambria';

    %tailwind arrow
    x = [0.765 0.715];
    y = [0.7 0.6];
    b = annotation('textarrow',x,y,'String','tailwind');
    b.FontName = 'Cambria';
    %headwind arrow
    x = [0.50 0.657];
    y = [0.35 0.445];
    c = annotation('textarrow',x,y,'String','headwind');
    c.FontName = 'Cambria';
    hold off;

end

