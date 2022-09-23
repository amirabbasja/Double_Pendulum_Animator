clc;

% Acquiring the model parameters
Params = out.params;
m1=Params(1); % First arm's mass (kg)
m2 =Params(2); % Second arm's mass (kg)
g =Params(3); % Gravity constant
c1 =Params(4); % Damping coeff of first joint
c2 =Params(5); % Damping coeff of second joint
Kt1 =Params(6); % Spring coeff of first joint
Kt2 =Params(7); % Spring coeff of second joint
l1 =Params(8); % First arm's length (m)
l2 =Params(9); % Second arm's length(m)
lc1=Params(10); % Distance of center of mass of forearm from elbow joint(m)
lc2 =Params(11); % Distance of center of mass of hand from wrist joint(m)

% Figure initiation and properties
figure; hold on
xlim([-(l1+l2)*1.1 (l1+l2)*1.1])
ylim([-(l1+l2)*1.1 (l1+l2)*1.1])
grid minor

% Determining the time and arm locations
time = out.time;

% Angle of first arm's
th1 = out.th1;
th2 = out.th2;

% CM and end of the first arm
cm1_x = lc1*cos(th1); 
cm1_y = lc1*sin(th1);
l1_x = l1*cos(th1); 
l1_y = l1*sin(th1);

% CM and end of the second arm
cm2_x = l1_x + lc2*cos(th2); 
cm2_y = l1_y + lc2*sin(th2);
l2_x = l1_x + l2*cos(th2); 
l2_y = l1_y + l2*sin(th2);

% Initiating the points and lines on the figure
point_cm1 = scatter(cm1_x(1),cm1_y(1), "filled", "LineWidth", 1.5, "Marker", "O");
point_l1 = line([0 l1_x(1)], [0 l1_y(1)], "lineWidth", 1.3);

% Initiating the points and lines on the figure
point_cm2 = scatter(cm2_x(1), cm2_y(1), "r", "filled", "LineWidth", 1.5, "Marker", "O");
point_l2 = line([l1_x(1) l2_x(1)], [l1_y(1) l2_y(1)], "Color", [0.9290 0.6940 0.1250], "lineWidth", 1.3);

for i = 1:1:size(time)
    t = time(i);

    title(sprintf("time = %f", round(time(i),2)))
    
    % Adding the points of the first arm
    point_cm1.XData = cm1_x(i);
    point_cm1.YData = cm1_y(i);
    
    point_l1.XData = [0 l1_x(i)];
    point_l1.YData = [0 l1_y(i)];

    % Adding the points of the secind arm
    point_cm2.XData = cm2_x(i);
    point_cm2.YData = cm2_y(i);
    
    point_l2.XData = [l1_x(i) l2_x(i)];
    point_l2.YData = [l1_y(i) l2_y(i)];

    % Delay
    pause(0.01)
    
    drawnow
    
end

