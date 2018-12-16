clear;
warning('off', 'Octave:possible-matlab-short-circuit-operator');

load('data.mat');

lambda = 0.5;
num_entradas  = rows(vocabList);
num_ocultas = 250000;
num_etiquetas = 2;  
options = optimset('MaxIter', 50000000);


r_theta1 = pesosAleatorios(num_entradas, num_ocultas);
r_theta2 = pesosAleatorios(num_ocultas, num_etiquetas);
params_rn = [r_theta1(:) ; r_theta2(:)];

theta = fmincg(@(t)(costeRN(params_rn, num_entradas, num_ocultas, num_etiquetas, X, y, lambda)), params_rn, options);

t1 = reshape(theta(1:num_ocultas * (num_entradas + 1)), 
                 num_ocultas, (num_entradas + 1));

t2 = reshape(theta((1 + (num_ocultas * (num_entradas + 1))):end), 
                 num_etiquetas, (num_ocultas + 1));
                 
acc = acierto(t1, t2, Xval, yval);

fprintf('\nTraining Set Accuracy: %f%%\n', acc * 100);