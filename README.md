# Artificial Potential Field-Based Path Planning for Cluttered Environments
An implementation for a path planning algorithm using artificial potential fields in MATLAB.
# Setup
Run the Bacteria_Run function with the parameter specifying the number and distribution of obstacles, we recommend running Bacteria_Run(randi([5 20],[50,2]));. This will create 50 uniformly distributed obstacles between 5 and 20 on the x and y axes on the map.
You will then see the map appear with the agent moving through the map to reach the target. In the case of a local minima or collision the agent stops moving and the run is terminated before reaching the target.
