%description
function [] = curveball_plot(x,y,z)

    hold on;
    t = title('Sidearm curve ball','FontWeight','Normal');
    t.FontName = 'Arial';   %change title font type
    
    %plot data
    plot(x,y,'black:',x,z,'blue-');
    
    %graph details
    axis([-10 70 -4 4]);
    xl = xlabel('x (feet)');
    xl.FontName = 'Arial';  %change x axis font type
    yl = ylabel('y or z (feet)');
    yl.FontName = 'Arial';  %change y axis font type
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
    
    %horizontal deflection arrow
    x = [0.5 0.545];
    y = [0.45 0.515];
    a = annotation('textarrow',x,y,'String',' ');
    a.HeadLength = 5.5;
    a.HeadWidth = 3.5;
    text(12,-0.75,'horizontal deflection (z)');
    
    %vertical deflection arrow
    x = [0.56 0.515];
    y = [0.8 0.715];
    b = annotation('textarrow',x,y,'String',' ');
    b.HeadLength = 5.5;
    b.HeadWidth = 3.5;
    text(21,3,'vertical deflection (y)');

    %pitcher arrow
    x = [0.285 0.235];
    y = [0.225 0.31];
    c = annotation('textarrow',x,y,'String',' ');
    c.HeadLength = 5.5;
    c.HeadWidth = 3.5;
    text(5,-3,'pitcher');
    
    %home plate arrow
    x = [0.750 0.8];
    y = [0.225 0.2515];
    d = annotation('textarrow',x,y,'String',' ');
    d.HeadLength = 5.5;
    d.HeadWidth = 3.5;
    text(45,-3.1,'home plate');
    
    hold off;

end

