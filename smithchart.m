clc; clear all; close all;
%For Drawing YZ smith chart

%no of points for circular variation, understand it by say number of values
%of x in f(x)
N=200;


%% Z-Smith Chart

%values of constant r circles
r        = [0 0.2 0.5 1];
%radius of constant r circles
radius_r = 1./(r+1);    
%abcissa of center of constant r circle
a_r      = r./(r+1);
%ordinate of center of constant r circle
b_r      = 0;

%plotting constant r circles
for i = 1:length(r)
    %creating values of x-axis variation, every rightmost point is 1
    %i.e. (1,0) in complex Gamma plane
    x_var = linspace(a_r(i)-radius_r(i),1,N);
    %temp variable for holding circle equation values
    t = sqrt((radius_r(i))^2 - (x_var-a_r(i)).^2);
    %breaking y-axis variation into +ve and -ve parts
    y1_var = b_r + t;   
    y2_var = b_r - t;
    %plotting the upper half i.e. +ve part of constant r circle
    plot(x_var,y1_var,'b','LineWidth',1.5);
    %for making axis equal, holding on the plot for multiple plot on same
    %graph, and for viewing the grid in background of plot
    axis('equal'); hold on; grid on
    %plotting the lower half i.e. -ve part of constant r circle
    plot(x_var,y2_var,'b','LineWidth',1.5);
end


%plotting real line from Real(Gamma) line within unit circle
plot(linspace(-1,1,N),zeros(1,N),'b');


%values of constant x circles
x        = [-0.5 -1 -3 0.5 1 3];
%radius of constant x circles
radius_x = 1./x;
%abcissa of center of constant x circle
a_x      = 1;
%ordinate of center of constant x circle
b_x      = 1./x;

%plotting constant x circles
for i = 1:length(x)
    %y-axis variation has been done here for ease i.e. for constatnt x
    %circles, y-axis values varies between 0 and point of intersection of
    %r=0 circle i.e. unit circle centered at origin of complex Gamma plane
    %where the point of intersection is 2x/(x^2 +1)
    y_var = linspace(0, (2*x(i)/(x(i)^2 +1)) ,N);
    %temp variable for holding circle equation values
    t = sqrt((radius_x(i))^2 - (y_var-b_x(i)).^2);
    %selected -ve part to plot because that is the one that will lie inside
    %unit circle
    x2_var = a_x - t;
    %plotting constant x circle +ve and -ve both
    plot(x2_var,y_var,'b','LineWidth',1.5);
end

%% Y Smith Chart

%values of constant g circles
g        = [0.2 0.5 1];
%radius of constant g circles
radius_g = 1./(g+1);
%abcissa of center of constant g circle, this time -ve of constant r circle
a_g      = -g./(g+1);
%ordinate of center of constant g circle
b_g      = 0;

%plotting constant g circles
for i = 1:length(g)
    %creating values of x-axis variation, every leftmost point is -1
    %i.e. (-1,0) in complex Gamma plane
    x_var = linspace(-1,a_g(i)+radius_g(i),N);
    %temp variable for holding circle equation values
    t = sqrt((radius_g(i))^2 - (x_var-a_g(i)).^2);
    %breaking y-axis variation into +ve and -ve parts
    y1_var = b_g + t;   
    y2_var = b_g - t;
    %plotting the upper half i.e. +ve part of constant r circle
    plot(x_var,y1_var,'m','LineWidth',1.5);
    %for making axis equal, holding on the plot for multiple plot on same
    %graph, and for viewing the grid in background of plot
    axis('equal'); hold on; grid on
    %plotting the lower half i.e. -ve part of constant r circle
    plot(x_var,y2_var,'m','LineWidth',1.5);
end


%values of constant b circles
b        = [-0.5 -1 -3 0.5 1 3];
%radius of constant b circles
radius_b = 1./b;
%abcissa of center of constant b circle, this time -ve of constant x circle
a_b      = -1;
%ordinate of center of constant b circle
b_b      = 1./b;

%plotting constant b circles
for i = 1:length(b)
    %y-axis variation has been done here for ease i.e. for constatnt g
    %circles, y-axis values varies between 0 and point of intersection of
    %g=0 circle i.e. unit circle centered at origin of complex Gamma plane
    %where the point of intersection is 2x/(x^2 +1)
    y_var = linspace(0, (2*b(i)/(b(i)^2 +1)) ,N);
    %temp variable for holding circle equation values
    t = sqrt((radius_b(i))^2 - (y_var-b_b(i)).^2);
    %selected +ve part to plot because that is the one that will lie inside
    %unit circle
    x2_var = a_b + t;
    %plotting constant b circle +ve and -ve both
    plot(x2_var,y_var,'m','LineWidth',1.5);
end

title('YZ Smith Chart');
xlabel('Real(\Gamma)');
ylabel('Imag(\Gamma)');
