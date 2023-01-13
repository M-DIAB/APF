function par = Bacteria_Calculate_Distances_Obstacles(par)

for i=1:size(par.detected_obstacles_distances,2)
    distance = sqrt(((par.robot_coordinates(1)-par.obstacles_coordinates(par.detected_obstacles_distances(1,i),1))^2)+((par.robot_coordinates(2)-par.obstacles_coordinates(par.detected_obstacles_distances(1,i),2))^2));
    if distance < par.detected_obstacles_distances(2,i)
        par.detected_obstacles_distances(2,i) = distance;
    end
end