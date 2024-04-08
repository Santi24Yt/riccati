hold on;

f = @(x, y) (-y.^2 / 50) + 2*y - 3*x;

f1 = @(x) 50 * (1 + sqrt(1 - (3*x/50)));
f2 = @(x) 50 * (1 - sqrt(1 - (3*x/50)));

solution = 50/3;

xstart = 0;
xrange = solution + 2;
xend = xstart + xrange;

ystart = 0;
yrange = 100;
yend = ystart + yrange;

steps = 200;
arrows = 20;

axis([xstart, xend, ystart, yend]);

yvc = linspace(ystart, yend, steps);
xvc = linspace(xstart, solution, steps);

yvv = linspace(ystart, yend, arrows);
xvv = linspace(xstart, solution, arrows);

plot(xvv, f1(xvv), ".", "color", "cyan", "markersize", 10);
plot(xvv, f2(xvv), ".", "color", "cyan", "markersize", 10);
plot(solution, f1(solution), ".", "markersize", 20, "color", "magenta");

plot(xvc, f1(xvc), "color", "blue");
plot(xvc, f2(xvc), "color", "blue");

zr = zeros(1, arrows);
os = ones(1, arrows);

if f(0.0001, 0) < 0
    quiver(xvv, f2(xvv), zr, os .* (1-f2(xvv)), "maxheadsize", 0.01, "autoscale", "off", "color", "red");
elseif f(0.0001, 0) > 0
    quiver(xvv, zeros(1, arrows), zr, os .* (f2(xvv)-1), "maxheadsize", 0.01, "autoscale", "off", "color", "green");
else
    error("Error");
end

if f(0, solution) < 0
    quiver(xvv, f1(xvv), zr, os .* (f2(xvv) - f1(xvv) + 1), "maxheadsize", 0.01, "autoscale", "off", "color", "red");
elseif f(0, solution) > 0;
    quiver(xvv, f2(xvv), zr, os .* (f1(xvv) - f2(xvv) - 1), "maxheadsize", 0.01, "autoscale", "off", "color", "green");
else
    error("Error");
end

if f(0.0001, 0) < 0
    quiver(xvv, f1(zr), zr, os .* (f1(xvv) - 99), "maxheadsize", 0.01, "autoscale", "off", "color", "red");
elseif f(0.0001, 0) > 0
    quiver(xvv, f1(xvv), zr, os .* (100 - f1(xvv)), "maxheadsize", 0.01, "autoscale", "off", "color", "green");
else
    error("Error");
end

rarrows = ceil(((xend-solution)*arrows)/(xend-xstart));
xrv = linspace(solution, xend, rarrows);
zrr = zeros(1, rarrows);
osr = ones(1, rarrows);

if f(solution + 0.0001, f1(solution+0.0001)) < 0
    quiver(xrv, f1(zrr), zrr, osr .* (1 - f1(zrr)), "maxheadsize", 0.01, "autoscale", "off", "color", "red");
elseif f(solution + 0.0001, f1(solution+0.0001)) > 0
    quiver(xrv, zrr, zrr, osr .* (f1(zrr) - 1), "maxheadsize", 0.01, "autoscale", "off", "color", "green");
else
    error("Error");
end

xlabel("x");
ylabel("y");

title("ODE of the form f_x (y) = ay^2 + by + h(x)");

% https://en.wikipedia.org/wiki/Riccati_equation

hold off;
