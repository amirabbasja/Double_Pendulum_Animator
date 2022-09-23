# Double_Pendulum_Animator
This repo animates a double pendulum in matlab

There are 3 main files, i will describe each one's purpose:
1-Animate.m: This file animates the double pendulum. I takes the data necessary and animates it. All the data needed for this simulation are essentially a time series data set for each of each pendulum's angle (Calculated from horizon).

2-MovementMaker.slx: This is a simulation file (Made by SIMULINK) that uses the double pendulum equations of motion to calculate the angle of each pendulum at each time step. It also calculates the angular velocity and angular acceleration of each pendulum. The acquired data then is exported to MATLAB's workspace. So for seeing the animation, you need to run the simulation file first. You can change the parameters of the double pendulumns from the "Parametes" block.

3-VectorField.m: Disregard this file, This file contains the dynamic equations obtained by Euler-Lagrange method and how we reduce the ODS System's order to first order system. This file is not necessary for the animation nor the simulation, Only the result has been used in main block of the simulation file.
