function par = Bacteria_Run(obstacles_coordinates)

%close all
par = Bacteria_Initialize(obstacles_coordinates);
Bacteria_Plot_Environment(par);
tic;
while(par.RDTT>0.7)
par = Bacteria_Plot_Robot(par);
par.move_count = par.move_count + 1;
par = Bacteria_Check_Safety(par);
if par.check==0
   break
end
par = Bacteria_Detect_Obstacles(par);
par = Bacteria_Calculate_Distances_Obstacles(par);
par = Bacteria_Robot_Potential(par);
par = Bacteria_Bacteria_Potential(par);
par = Bacteria_Bacteria_Selection(par);
par.et = toc;
if par.check==0
par = Bacteria_Bacteria_Random_Selection(par);
end
if par.et>90
    break
end

pause(0.1);
end
if par.check==1
par.et2=toc;      %recording the time it took for a successful run
end
par.average_distance=mean(par.detected_obstacles_distances(2,:));  %recording the average distance to obstacles