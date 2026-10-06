clc; clear all; close all;

syms a b c real
assumeAlso(a^2 + b^2 + c^2 == 1)
assumeAlso(c > -1) % <-- pos. thrust, implies c+1>0, if not c+1 could be complex?
% assumeAlso(c ~= -1) <-- the singularity
t = [a; b; c];

q = (1/(2*sqrt(1+c))) * [1+c; -b; a; 0];
v = q(2:end);

n = simplify(v / norm(v), 'Steps', 50)

% random unit vector on S^2
t = rand(3,1);
t = t / norm(t);

a = t(1);
b = t(2);
c = t(3);

% quaternion vector part
v = [-b; a; 0];

% normalize to get rotation axis
n = v / norm(v);


figure; hold on; grid on; axis equal;
xlabel('x'); ylabel('y'); zlabel('z');
view(3);
title('chart 1')
% origin
O = [0;0;0];

% plot t (blue)
quiver3(O(1),O(2),O(3), t(1),t(2),t(3), ...
    'LineWidth',2,'Color','b','MaxHeadSize',0.5);

% plot n (red)
quiver3(O(1),O(2),O(3), n(1),n(2),n(3), ...
    'LineWidth',2,'Color','r','MaxHeadSize',0.5);

% reference e3
e3 = [0;0;1];
quiver3(0,0,0,e3(1),e3(2),e3(3), ...
    'LineWidth',1.5,'Color','k','LineStyle','--');

legend('t (target vector)','n (rotation axis)','e_3');
