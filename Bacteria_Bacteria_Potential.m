function par = Bacteria_Bacteria_Potential(par)

par.J_ObstBT = zeros(1,par.bacteria_no);
par.J_GoalBT = zeros(1,par.bacteria_no);
par.BDTT = zeros(1,par.bacteria_no);

for i=1:par.bacteria_no
    par.BDTT(i) = sqrt(((par.bx(i)-par.target_coordinates(1))^2)+((par.by(i)-par.target_coordinates(2))^2));   %bacteria distance to target
for j=1:size(par.obstacles_coordinates_detected,1)
     dist = sqrt(((par.bx(i)-par.obstacles_coordinates_detected(j,1))^2)+((par.by(i)-par.obstacles_coordinates_detected(j,2))^2));
     if         dist >= par.potential_lower_distance_limit && dist <= par.potential_upper_distance_limit
                pot_val = par.obstacle_bacteria(1)*exp(-par.obstacle_bacteria(2)*(((par.bx(i)-par.obstacles_coordinates_detected(j,1))^2)+((par.by(i)-par.obstacles_coordinates_detected(j,2))^2)));       
     elseif     dist < par.potential_lower_distance_limit
                pot_val = inf;
     else
                pot_val = 0;
     end
     par.J_ObstBT(i) = par.J_ObstBT(i) + pot_val;
end
par.J_GoalBT(i) = -par.target(1)*exp(-par.target(2)*(((par.bx(i)-par.target_coordinates(1))^2)+((par.by(i)-par.target_coordinates(2))^2)));
par.J_BT(i) = par.J_GoalBT(i) + par.J_ObstBT(i);                           %total potential on bacteria point
end