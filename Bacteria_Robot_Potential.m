function par = Bacteria_Robot_Potential(par)

for j=1:size(par.obstacles_coordinates_detected,1)
    dist = sqrt(((par.obstacle_robot(1)-par.obstacles_coordinates_detected(j,1))^2)+((par.obstacle_robot(2)-par.obstacles_coordinates_detected(j,2))^2));
    if dist >= par.potential_lower_distance_limit && dist <= par.potential_upper_distance_limit
                pot_val = par.obstacle_robot(1)*exp(-par.obstacle_robot(2)*(((par.robot_coordinates(1)-par.obstacles_coordinates_detected(j,1))^2)+((par.robot_coordinates(2)-par.obstacles_coordinates_detected(j,2))^2)));
    elseif      dist < par.potential_lower_distance_limit
                pot_val = inf;
    else
                pot_val = 0;
    end
    par.J_obstRT = par.J_obstRT + pot_val;
end

par.RDTT=sqrt(((par.robot_coordinates(1)-par.target_coordinates(1))^2)+((par.robot_coordinates(2)-par.target_coordinates(2))^2));    %robot distance to target

par.J_GoalRT = -par.target(1)*exp(-par.target(2)*(((par.robot_coordinates(1)-par.target_coordinates(1))^2)+((par.robot_coordinates(2)-par.target_coordinates(2))^2)));

par.J_RT = par.J_GoalRT + par.J_obstRT;                                    %total potential on robot