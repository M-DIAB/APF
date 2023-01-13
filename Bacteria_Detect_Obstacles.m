function par = Bacteria_Detect_Obstacles(par)

for j=1:size(par.obstacles_coordinates,1)
    distance = sqrt(((par.robot_coordinates(1)-par.obstacles_coordinates(j,1))^2)+((par.robot_coordinates(2)-par.obstacles_coordinates(j,2))^2));   


        if sqrt(((par.robot_coordinates(1)-par.obstacles_coordinates(j,1))^2)+((par.robot_coordinates(2)-par.obstacles_coordinates(j,2))^2)) <= par.sensor_range && ismember(par.obstacles_coordinates(j,:),par.obstacles_coordinates_detected,'rows') == 0
           par.obstacles_coordinates_detected(par.det,:) = par.obstacles_coordinates(j,:);
           par.detected_obstacles_distances(1,par.det) = j;                %registering the index and distance to each obstacle detected
           par.detected_obstacles_distances(2,par.det) = distance;
           par.det = par.det+1;
        end
        
end