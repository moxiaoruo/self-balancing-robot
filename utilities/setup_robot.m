%% wheeled self balance robot paramaters setting
L=0.12;  %length form body to wheel
r=0.05;          % radia m
width=0.03;   
MW= pi*r^2*width*1000;  % mass of wheel kg
IW=1/2*MW*r^2;  % inertia of wheel kg*m^2
MP= 2.5;  % mass of body kg
IP= MP*L^2; % inertia of body kg*m^2

Ts=0.016;
battery=10;

R=10;    %motor resistance
ke=0.1;
km=0.1;
alpha= MP*L^2+IP;
bata= MW+IW/(r^2)+MP;
g=9.81;
A=[ 0 1 0 0;
    0 (km*ke*(alpha+MP*L*r))/(R*r^2*(alpha*bata-MP^2*L^2)) ((MP*L)^2)*g/(alpha*bata-((MP*L)^2)) 0;
    0 0 0 1;
    0 km*ke*(bata*r+MP*L)/(R*r^2*(alpha*bata-MP^2*L^2)) MP*L*g*bata/((alpha*bata)-((MP*L)^2)) 0];
B=[0; (alpha*km+km*MP*L*r)/(R*r*(alpha*bata-MP^2*L^2)); 0; (alpha*km-km*MP*L)/(R*r*(alpha*bata-MP^2*L^2)) ];
C=eye(4);
D=[0; 0; 0; 0];
Cn = [1 0 0 0];
sys = ss(A,B,Cn,0);
Q = C'*C;
R = 1;

Q(1,1) = 5000;
Q(3,3) = 100;
Cn = [1 0 0 0];
sys_ss = ss(A,B,Cn,0);
K = lqr(A,B,Q,R);
Nbar = rscale(sys_ss,K);
co = ctrb(sys);
controllability = rank(co)
ob = obsv(sys);
observability = rank(ob)
Ac = [(A-B*K)];
poles = eig(Ac);
P = [-10 -11 -12 -13];
L = place(A',C',P)'