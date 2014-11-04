function monorailModel()
    %A function that doesn't return anything, but makes it easier to call
    
     %Loads the results from statpend
    statpend;
%     F15A400;
    %Set voltage
    voltage = 12;
    
    %Converting all the data from the statpend file into SI/metric units
    
    %Extract time
    %Measured in ms
    time = results(1:1000, 1) / 1000; %Converts into seconds
    
    %Extract position
    %200.379 encoder counts = 1mm
    pos  = results(1:1000, 2) / (200.379 * 1000); %Converts into meters
    
    %Extract angle
    %20000 encoder counts = 360 degrees
    ang  = results(1:1000, 3) / 20000; %Converts to degrees
    
    %Extract velocity
    %200.379 encoder counts = 1mm/s
    vel  = results(1:1000, 4) / (200.379 * 1000); %Converts into m/s
%     vel = vel/12;
    
    %Plot the curve of the statpend file
    figure(1); clf; hold on;
    plot(time, vel);
    title('STATPEND File - Velocity vs Time');
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    hold off;
    
    
    %Solved in curveFit
    Td = 0.1870;
    Ad = 0.0863;
    
    %Found manually to fit the curve
    Tb = 0.134;
    Ab = 0.083;
    
    
    options = odeset('RelTol',1e-4,'AbsTol',[1e-5 1e-5]);
    [t,y] = ode45(@curveFit, [0 2], [0 0], options);
    
    figure(2); clf; hold on;
    plot(time, vel, 'r');
    plot(t, y(:, 2), 'b');
    title('Simulation vs STATPEND - Velocity vs Time');
    xlabel('Time (s)');
    ylabel('Velocity (m/s)');
    legend('STATPEND', 'curveFit');
    hold off;

end