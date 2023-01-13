function Bacteria_Plot_Environment(par)
figure();
hold on
axis(par.map_size);
plot(par.target_coordinates(1),par.target_coordinates(2),'X','color','red','MarkerSize',15);                       %plot the target

%...............................Plotting the Obstacles.....................
for i=1:size(par.obstacles_coordinates,1)
    plot(par.obstacles_coordinates(i,1),par.obstacles_coordinates(i,2),'*','color','black','MarkerSize',10);    %plot the obstacles
end