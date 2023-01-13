function par = Bacteria_Initialize(obstacles_coordinates)                                                  %for initializing all the variables to be used

par.map_size = [0 30 0 30];                                                %to set the size of the environment [xmin xmax ymin ymax]
par.robot_coordinates = [3 3];                                             %robot coordinates [x y]
par.obstacles_coordinates = obstacles_coordinates;                         %[obstacle1x obstacle1y; obstacle2x obstacle2y; ...]
par.obstacles_coordinates_detected = double.empty(0,2);                    %for logging detected obstacles
par.detected_obstacles_distances = double.empty(2,0);                      %for logging the minimum distance to each detected obstacle. First row is the index of the generated obstacle, second row is the lowest recorded distance to that obstacle
par.target_coordinates = [22 22];                                          %target coordinates [x y]
par.sensor_range = 8;                                                      %sensor range
par.step_size              = 0.05*par.sensor_range;                         %radius of bacteria points
par.alpha_o_range          = [0.1:0.1:50];                                 %range for alpha for obstacle potential
par.mu_o_range             = [1:1000];                                     %range for mu for obstacle potential
par.avg_r                  = zeros(1,1);                                   %for storing the average distance from obstacles
par.r_sum                  = zeros(1,1);                                   %for storing the summation of dstances from obstacles
%[p, q]                = meshgrid(par.alpha_o_range,par.mu_o_range);       %for creating all possible alpha and mu combinations for obstacles
%par.obstacle             = [p(:) q(:)];                                   %combination of alpha and mu ranges for obstacles in the form [alpha1 mu1; alpha1 mu2; alpha1 mu3;...; alpha2 mu1; alpha2 mu2; alpha2 mu3;...; alphaN muM]
%par.obstacle_robot       = double.empty(2);                               %for storing the final alpha and mu values for the obstacles for the robot
%par.obstacle_bacteria       = double.empty(2);                            %for storing the final alpha and mu values for the obstacles for the selected bacteria point
par.obstacle_robot       = [1 1000];                                 %for storing the final alpha and mu values for the obstacles for the robot
par.obstacle_bacteria       = [1 1000];                           %for storing the final alpha and mu values for the obstacles for the selected bacteria point
par.target                  = [100000 1];                                  %[alpha mu] for the target potential
par.bacteria_no             = 60;                                          %number of bacteria points
par.bacteria_degree             = 360/par.bacteria_no;                     %degree separation of bacteria points
par.bacteria_angles        = [par.bacteria_degree:par.bacteria_degree:360];%setting the angles of the bacteria points
par.potential_lower_distance_limit         = 0.4;                                  %lower distance limit for potential calculation below that distance to obstacle potential is infinity
par.potential_upper_distance_limit         = 4.5;                                  %upper distance limit for potential calculation above that distance to obstacle potential is zero
par.safety_margin           = 0.25;                                         %safety margin, if the agent's distance to any detected obstacle is below this margin then terminate the run (Collision Case)
par.confirm                 = 'Solution Found';                            %message for finding a good bacteria point in an iteration
par.error                   = 'Solution Not Found';                        %message for not finding a good bacteria point in an iteration
par.RDTT=sqrt(((par.robot_coordinates(1)-par.target_coordinates(1))^2)+((par.robot_coordinates(2)-par.target_coordinates(2))^2));    %robot distance to target
par.J_obstRT                = 0;                                           %initialize potential value

%.................................Storage Variables.....................................
par.err_J_sto_s = zeros(1,1);                                              %to store the errors in the potential for each successful movement decision
par.err_J_sto = zeros(1,1);                                                %to store the value of the potential errors for analysis and plotting at each bacteria point that has lowest DTT at each iteration
par.err_J_sto_f = zeros(1,1);                                              %to store the minimum potential error in the bacteria points for each iteration
par.JT_sto = zeros(1,1);                                                   %to store the total potential value for the robot at each iteration
par.JT_bacteria_sto = zeros(1,1);                                          %to store the value of the potential for analysis and plotting at each bacteria point that has lowest DTT at each loop
par.JT_bacteria_sto_f = zeros(1,1);                                        %to store the minimum potential error in the bacteria points for each loop
par.move_count = 0;                                                        %to keep track of how many times the robot moves (number of successful iterations)
par.loop = 0;                                                              %to keep track of the number of iterations (execution loops)
par.det = 1;                                                               %to keep track of the detected obstacles