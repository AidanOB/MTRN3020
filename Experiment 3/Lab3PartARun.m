function Lab3PartARun(a, b)
    
    ROT335;
    figure(a);clf; hold on;
    plot(TEST(:,1)/1000, TEST(:,3), 'b');

    A = max(TEST(:,3));
    tau = TEST(max(find(TEST(1:250,3) < max(TEST(:,3)) *(2/3))),1)/1000
    t = 0:0.005:1.5;
    y_theoretical = A*(1-exp(-t/tau));
    plot(t, y_theoretical, 'r');
    xlabel('Time (ms)');
    ylabel('Speed (count/s)');
    title('Speed vs Time');
    legend('Experimental', 'Theoretical');
    hold off;
    
    A3324494;
    
    A = max(RUN(:,3));
    tau = TEST(max(find(RUN(1:250,3) < max(RUN(:,3)) *(2/3))),1)/1000
    
    
    simOut = sim( 'Lab3partA', 'SaveOutput', 'on' );
    y_sim = simOut.get( 'y' );
    x_sim = simOut.get( 't' );
    x_sim = x_sim + 0.12;
%     Lab3PartA
    figure(b); clf; hold on;
    plot(RUN(:,1)/1000, RUN(:,3)/37.8, 'r')
    plot(x_sim, y_sim, 'b')
    xlabel('Time (s)');
    ylabel('Position');
    title('Design Verification');
    legend('Experimental', 'Simulation');
    hold off;


end