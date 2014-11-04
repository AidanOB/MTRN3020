function Lab2Run()
%     clear all; clc;

    %Display Part A
    %Load Data
    A3324494
    
    %Run Simulation
    simOut = sim( 'Lab2partA', 'SaveOutput', 'on' );
    y_sim = simOut.get( 'OutputA' );
    x_sim = simOut.get( 'TimeA' );

    figure(1); clf; hold on;
    %Scale experimental data to s and rpm
    plot(RUN(:,1)/1000, RUN(:,3)/(8192/60), 'r')
    plot(x_sim, y_sim, 'b')
    xlabel('Time (s)');
    ylabel('Speed (rpm)');
    title('Design Verification');
    legend('Experimental', 'Simulation', 'Location', 'SouthEast');
    set(gcf, 'Color', [1 1 1]);
    hold off;

    
    %Load Part B
    B3324494
    
    %Run Simulation
    simOut = sim( 'Lab2partB', 'SaveOutput', 'on' );
    y_sim = simOut.get( 'OutputB' );
    x_sim = simOut.get( 'TimeB' );

    figure(2); clf; hold on;
    %Scale experimental data to s and rpm
    plot(RUN(:,1)/1000, RUN(:,3)/(8192/60), 'r')
    plot(x_sim, y_sim, 'b')
    xlabel('Time (s)');
    ylabel('Speed (rpm)');
    title('Disturbance Rejection');
    legend('Experimental', 'Simulation', 'Location', 'SouthEast');
    set(gcf, 'Color', [1 1 1]);
    hold off;
    
    %Getting a close-up of the disturbance rejection
    figure(3);clf; hold on;
    %Scale experimental data to s and rpm
    plot(RUN(:,1)/1000, RUN(:,3)/(8192/60), 'r')
    plot(x_sim, y_sim, 'b')
    xlabel('Time (s)');
    ylabel('Speed (rpm)');
    title('Disturbance Rejection');
    legend('Experimental', 'Simulation', 'Location', 'SouthEast');
    axis([1 12 1700 2300]);
    set(gcf, 'Color', [1 1 1]);
    hold off;

    length(x_sim)
    length(RUN(:,1))
    
end