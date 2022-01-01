figure('Renderer', 'painters', 'Position', [0 0 800 800]);

x=[-1.5 -0.5 -0.5 0.5 0.5 1.5 1.5 -1.5 -1.5];
y=[0 0 -12 -12 0 0 10 10 0];

fill(x,y,'black');
hold on;

r = 1;
theta = 0:1:360;
x = r*cosd(theta);
dark = [0 0.4 0;0.4 0.4 0;0.4 0 0];
light = [0 1 0;1 1 0;1 0 0];
shift=2:3:8;
time = 3;
while true
    for i=1:3
        y = r*sind(theta)+shift(i);
        if time == i
            fill(x,y,light(i,:));
        else
            fill(x,y,dark(i,:));
        end
        hold on;
        axis([-13 13 -14 12]);
    end
    time = mod(time+1,3)+1;
    pause(1);
end