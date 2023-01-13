function par = Bacteria_Bacteria_Random_Selection(par)

i = randi(par.bacteria_no);

if par.J_BT(i) ~= inf
       par.robot_coordinates(1)=par.bx(i)+0.1*randn;                      %also adding a random error with a scaled (0.1) standard normal distribution (zero mean and unity standard deviation (1)) to each selected coordinate
       par.robot_coordinates(2)=par.by(i)+0.1*randn;
       par.check = 1;
end