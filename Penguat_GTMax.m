clear all;
% Sebuah Transistor memiliki S-paramter 
% berikut ini
s11 = 0.72*exp(j*deg2rad(-116));
s12 = 0.03*exp(j*deg2rad(57));
s21 = 2.60*exp(j*deg2rad(76));
s22 = 0.73*exp(j*deg2rad(-54));

%% menghitung nilai K
Delta = s11*s22 - s12*s21;
K = (1-(abs(s11)^2)-(abs(s22)^2)+(abs(Delta)^2))/(2*abs(s12*s21));

%%% kalau K>1 dan abs(Delta)<1 -> Mantap tanpa syarat

%% mencari B1, B2, C1, C2, gammaL, gammaS
B1 = 1 + abs(s11)^2 - abs(s22)^2 - abs(Delta)^2;
B2 = 1 + abs(s22)^2 - abs(s11)^2 - abs(Delta)^2;
C1 = s11 - Delta*conj(s22);
C2 = s22 - Delta*conj(s11);

gammaL_c = (B2-sqrt(B2^2-4*abs(C2)^2))/2/C2;
gammaL = [abs(gammaL_c), rad2deg(angle(gammaL_c))];
gammaS_c = (B1-sqrt(B1^2-4*abs(C1)^2))/2/C1;
gammaS = [abs(gammaS_c), rad2deg(angle(gammaS_c))];

gammaOut = [abs(gammaL_c), -rad2deg(angle(gammaL_c))];
gammaIn = [abs(gammaS_c), -rad2deg(angle(gammaS_c))];

%% mencari GT Maximum
GTmax = (abs(s21)/abs(s12))*(K-sqrt(K^2-1));