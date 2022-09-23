clc;
clear;

syms th1(t) th2(t) xd(t) T1(t) T2(t) F_SMA(t) m1(t)
syms m2(t) md(t) g(t) c1(t) c2(t) Kt1(t) Kt2(t) cd(t) kd(t) l1(t) l2(t) lc1(t) lc2(t) ld(t)
% % The numerical parameters for hand and wrist are taken from: 
% % DOI: 10.1016/0021-9290(95)00178-6
% % But for the sake of generalization, we will find the vector field with
% % symbolic values of model parameters
% m1=1.1826; % Forearm's mass (kg)
% m2 =0.4453; % Hand's mass (kg)
% md =1; % Absorber's mass  (kg)
% g =9.81; % Gravity constant
% c1 =0; % Damping coeff of elbow joint
% c2 =0; % Damping coeff of wrist joint
% Kt1 =0; % Spring coeff of elbow joint
% Kt2 =0; % Spring coeff of wrist joint
% cd =1; % Damping coeff of absorber
% kd =1; % Spring coeff of absorber
% l1 =0.2513; % Forearm length (m)
% l2 =0.1899; % Hand length(m)
% lc1=0.1166; % Distance of center of mass of forearm from elbow joint(m)
% lc2 =0.0701; % Distance of center of mass of hand from wrist joint(m)
% ld = 0.01; % Distance of absorber from elbow joint(m)


eq1 = g*cos(th1)*lc1*m1 + Kt1*th1+lc1^2*m1*diff(th1,2)+l1^2*m2*diff(th1,2)+l1*m2*(g*cos(th1)+lc2*(sin(th1-th2)*diff(th2,1)^2+cos(th1-th2)*diff(th2,2)))== T1 - c1 * diff(th1,1);

eq2 = Kt2*th2+lc2*m2*(g*cos(th2)+l1*(-sin(th1-th2)*diff(th1,1)^2+cos(th1-th2)*diff(th1,2)))+lc1^2*m2*diff(th2,2)== T2 - c2*diff(th2,1);

[V,S] = odeToVectorField(eq1, eq2)