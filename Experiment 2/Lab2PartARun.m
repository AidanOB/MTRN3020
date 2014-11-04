function Lab2PartARun()
    A3324494
    simOut = sim( 'Lab2partA', 'SaveOutput', 'on' );
    y_sim = simOut.get( 'OutputA' );
    x_sim = simOut.get( 'TimeA' );
%     Lab2PartA
    figure(1); clf; hold on;
    plot(RUN(:,1)/1000, RUN(:,3)/136.8, 'r')
    plot(x_sim, y_sim, 'b')
    xlabel('Time (s)');
    ylabel('Speed (rpm)');
    title('Design Verification');
    legend('Experimental', 'Simulation');
    hold off;


end