function simRun()
    [time, pos, ang, vel] = convertCartLogFiles('A3324494');

    
    options = odeset('RelTol',1e-4,'AbsTol',[1e-5 1e-5 1e-5 1e-5]);
    [t,y] = ode45(@monorailSimulation, [0 2], [0 0 0 0], options);
    
    figure(2); clf; hold on;
    plot(time, vel, 'r');
    plot(t, y(:, 2), 'b');
    title('Simulation vs Experimental Data - Velocity vs Time');
%     title('Experimental Data - Velocity vs Time');
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    legend('Data', 'curveFit');
    hold off;

    figure(3); clf; hold on;
    plot(time, pos, 'r');
    plot(t, y(:, 1), 'b');
    title('Simulation vs Experimental Data - Position vs Time');
    xlabel('Time (s)');
    ylabel('Position (m)');
    legend('Data', 'Simulation');
    hold off;
    
    figure(4); clf; hold on;
    plot(time, ang*180/pi, 'r');
    plot(t, y(:, 3)*180/pi, 'b');
    title('Simulation vs Experimental Data - Angle vs Time');
    xlabel('Time (s)');
    ylabel('Angle (degrees)');
    legend('Data', 'Simulation');
    hold off;

    
    %As the length found from the ode and the angle from results are
    %different for the two vectors, must have much closer matcches to their
    %relative time locations. Ang is ~7 times as long as the found vector.
    
    prunedAngle = zeros(length(y(:,3)), 1);
    prunedPosit = zeros(length(y(:,1)), 1);
    j = 1;
    
    for i=1:7:length(ang)
        prunedAngle(j) = ang(i);
        prunedPosit(j) = pos(i);
        prunedTime(j) = time(i);
        j = j+1;
    end
    
    %Solving for MSE and MAE
    posMSE = mean((prunedPosit - y(:,1)).^2);
    angMSE = mean((prunedAngle - y(:,3)).^2);
    posMAE = max(abs(prunedPosit - y(:,1)));
    angMAE = max(abs(prunedAngle - y(:,3)));
    

    
    [t1,y1] = ode45(@monorailStopping, [0 2], [0 0 0 0], options);
    
    %Not really needed once details found
%     figure(5); clf; hold on;
%     plot(time, pos, 'r');
%     plot(t1, y1(:, 1), 'b');
%     title('Simulation vs Experimental Data - Position vs Time');
%     xlabel('Time (s)');
%     ylabel('Position (m)');
%     legend('Data', 'Simulation');
%     hold off;
%     
%     figure(6); clf; hold on; 
%     plot(time, ang*180/pi, 'r');
%     plot(t1, y1(:, 3)*180/pi, 'b');
%     title('Simulation vs Experimental Data - Angle vs Time');
%     xlabel('Time (s)');
%     ylabel('Angle (degrees)');
%     legend('Data', 'Simulation');
%     hold off;
    
    figure(7); clf; hold on; grid on;
    plot(t1, y1(:, 3), 'r');
    plot(t1, y1(:, 2), 'b');
    plot(t1, y1(:, 1), 'g');
    title('Simulation - Position, Angle, Velocity vs Time');
    xlabel('Time (s)');
    ylabel('Angle (rads), Position (m), Velocity (m/s)');
    legend('Angle', 'Velocity', 'Position');
    hold off;
    
end