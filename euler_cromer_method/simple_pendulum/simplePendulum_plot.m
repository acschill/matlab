%plots simple pendulum 
function [] = simplePendulum_plot(time, theta)

    hold on;
    title('Simple Pendulum - Euler-Cromer method','FontWeight','Normal','FontSize', 12,'FontName','sans-serif');

    %plot data
    plot(time, theta);
    
    %graph details
    axis([0 10 -0.3 0.3]);
    xlabel('time (s)','FontName','sans-serif')
    ylabel([952 ' (radians)'],'FontName','sans-serif');
    xticks(0:2:10);
    yticks(-0.3:0.1:0.3);
    text(1.75,0.25,'Length = 1 m         time step = 0.04 s','FontSize',12,'FontName','sans-serif');
    box on
    pbaspect([1.1 1 1])
    hold off;

end


