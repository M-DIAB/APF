function par = Bacteria_Plot_Robot(par)

plot(par.robot_coordinates(1),par.robot_coordinates(2),'.','color','black','MarkerSize',15);    %plot the robot

par.bx = zeros(1,par.bacteria_no);
par.by = zeros(1,par.bacteria_no);

for i=1:par.bacteria_no                                                    %calculate bacteria points coordinates
    par.bx(i) = par.robot_coordinates(1) + (par.step_size*cosd(par.bacteria_angles(i)));
    par.by(i) = par.robot_coordinates(2) + (par.step_size*sind(par.bacteria_angles(i)));
end

plot(par.bx,par.by,'.','color',[0.9290 0.6940 0.1250]);                                                   %plot bacteria points