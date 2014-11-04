function [time, pos, ang, vel] = convertCartLogFiles(filename)
    %Converting all the data from the statpend file into SI/metric units
    
    %Put file to be converted here
    A3324494
%     F15A400
    
    %Extract time
    %Measured in ms
    time = results(1:1015, 1) / 1000; %Converts into seconds
    
    %Extract position
    %200.379 encoder counts = 1mm
    pos  = results(1:1015, 2) / (200.379 * 1000); %Converts into meters
    
    %Extract angle
    %20000 encoder counts = 360 degrees
    ang  = results(1:1015, 3) * (2*pi/20000);%Converts to degrees
    
    %Extract velocity
    %200.379 encoder counts = 1mm/s
    vel  = results(1:1015, 4) / (200.379 * 1000); %Converts into m/s




end