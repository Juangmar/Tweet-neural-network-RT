clear;
warning('off', 'all');

load('data.mat');

x = [ones(rows(y),1), X];
xval = [ones(rows(yval),1), Xval];

theta = [zeros(columns(x),1)];

[J, grad] = coste(theta, X, y);
opciones = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(coste(t, X, y)), theta, opciones);
accuracy = acc(theta, xval, yval);
