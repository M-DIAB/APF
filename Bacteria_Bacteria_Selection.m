function par = Bacteria_Bacteria_Selection(par)

err_DTT = zeros(1,par.bacteria_no);
err_J = zeros(1,par.bacteria_no);
for i=1:par.bacteria_no
    err_DTT(i) = par.BDTT(i) - par.RDTT;
    err_J(i) = par.J_BT(i)-par.J_RT;                                    %error in potential for bacteria points
end

par.check = 0;                                                             %to indicate if a solution (bacteria point was found)

for j=1:par.bacteria_no
   [~,mi]=min(err_DTT);                                                    %check closest bacteria point to target first
   if err_J(mi)<0                                                          %if condition satisfied move to bacteria point
       par.robot_coordinates(1)=par.bx(mi)+0.1*randn;                      %also adding a random error with a scaled (0.1) standard normal distribution (zero mean and unity standard deviation (1)) to each selected coordinate
       par.robot_coordinates(2)=par.by(mi)+0.1*randn;
       par.check = 1;
       break   
   else
       err_DTT(mi) = inf;
   end
end