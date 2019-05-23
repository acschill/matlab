%description
%plots omega vs time values
function [] = omegavstime_plot(time1, w_om1, time2, w_om2, time3, w_om3)

    hold on;
    title([969 ' versus time'],'FontWeight','Normal','FontSize', 12,'FontName','sans-serif');

    %plot data
    figure(1);
    hold all;
    
    plot(time1, w_om1+4);
    plot(time2, w_om2+3);
    plot(time3, w_om3);
   
    %customize x and y ticks
    xticks(0:20:60);
    set(gca,'ytick',[-1 0 1 3 4 5] );
    set(gca,'yticklabel',[-1 0 1 0 0 1] );
   
    xlabel('time (s)','FontName','sans-serif')
    ylabel([969 ' (radians/s)'],'FontName','sans-serif');
    
    text(45,4.25,'F_D = 0','FontName','sans-serif');
    text(45,2.15,'F_D = 0.5','FontName','sans-serif');
    text(41.5,-1.25,'F_D = 1.2','FontName','sans-serif');
    
    box on
    pbaspect([1 1 1])
    hold off;

end
