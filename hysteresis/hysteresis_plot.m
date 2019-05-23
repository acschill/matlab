%description
function [] = hysteresis_plot(x,y,z)

    hold on;
    title('Sidearm curve ball');
    
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


    hold off;

end

