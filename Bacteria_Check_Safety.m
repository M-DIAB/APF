function par = Bacteria_Check_Safety(par)

par.check = 1;
for i=1:1:size(par.obstacles_coordinates_detected,1)
    if sqrt(((par.robot_coordinates(1)-par.obstacles_coordinates_detected(i,1))^2)+((par.robot_coordinates(2)-par.obstacles_coordinates_detected(i,2))^2)) < par.safety_margin
        par.check = 0;
        break
    end
end