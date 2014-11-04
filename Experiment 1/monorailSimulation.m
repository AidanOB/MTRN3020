function dy = monorailSimulation(t, y)
    %A function designed to simulate the monorail cart in the mechatronics
    %lab
    
    %Set variables
    voltage = 12;
    g = 9.81;
    l = 340.6/1000;
    massPen = 0.216;
    massCart = 1.93;
    
    dy = zeros(4, 1);
    
    [time, pos, ang, vel] = convertCartLogFiles('A3324494');

    %Set x1-x4 from y
    x1 = y(1);
    x2 = y(2);
    x3 = y(3);
    x4 = y(4);
    
    %T1 time given to me
    %3324494 = 290ms
    T1 = 0.290;
%     T1 = 0.4;
    
    %Set constants for monorail determined from part 2 of assignment
    %Solved in curveFit
    Td = 0.220;
    Ad = 0.085;
    Tb = 0.1366;
    Ab = 0.059;

    
    if t < T1 %Personalised Data
%     if t < 0.4 %Lab at 400
        %Driving period
        A = Ad;
        T = Td;
        V = voltage;
%     elseif t < 0.75 && t > 400 % Lab at 400
    elseif t < 0.64 && t > T1 %Personalised
        %Braking Period
        A = Ab;
        T = Tb;
        V = -1;
    else
        A = Ab;
        T = Tb;
        V = -1;
    end
    
    x_dd = (A*V - x2)/T;
    
    dy(1) = x2; 
    dy(2) = x_dd;
    dy(3) = x4;
    dy(4) = -(cos(x3)*x_dd + g*sin(x3))/l;
    
    if x2 < 0
        dy(2) = 0;
    end

end