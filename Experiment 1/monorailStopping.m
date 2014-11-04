function dy = monorailStopping(t, y)
    %A function designed to simulate the monorail cart in the mechatronics
    %lab
    
    %Set variables
    voltage = 12;
    g = 9.81;
    l = 340.6/1000;
    massPen = 0.216;
    massCart = 1.93;
    
    negVel = false;
    negAng = false;
    
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
%     T2 = 0.2521;
    T2 = 0.310;
    T3 = 0.272;



    %Set constants for monorail determined from part 2 of assignment
    %Solved in curveFit
    Td = 0.220;
    Ad = 0.085;
    Tb = 0.1366;
    Ab = 0.059;

    
    if t < T1 
        %Driving period
        A = Ad;
        T = Td;
        V = voltage;
    elseif t < (T1 + T2)
        %Braking Period
        A = Ab;
        T = Tb;
        V = -1;
        if x2 < 0
            negVel = true;
        end

    elseif t < (T1 + T2 + T3)
        %Second Driving Period
        A = Ad;
        T = Td;
        V = voltage;
    else
        %Brake to stop
        A = Ab;
        T = Tb;
        V = -1;
        if x2 < 0
            negVel = true;
        end
    end
    
    x_dd = (A*V - x2)/T;
    
    dy(1) = x2; 
    dy(2) = x_dd;
    dy(3) = x4;
    dy(4) = -(cos(x3)*x_dd + g*sin(x3))/l;

    
    if negVel 
        dy(2) = 0;
    end
    if t > 1.44 
        dy(3) = 0;
    end



end