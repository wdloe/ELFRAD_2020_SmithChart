clear all;
% Menghitung GT, GP, GA dari Transistor
%% PARAMETER
s11 = 0.5*exp(j*deg2rad(-180));
s12 = 2.5*exp(j*deg2rad(70));
s21 = 0.08*exp(j*deg2rad(30));
s22 = 0.8*exp(j*deg2rad(-100));

f = 1e9; Z0 = 50; ZS = 25; ZL = 40;

%% JANGAN DIGANTI
gammaS = (ZS-Z0)/(ZS+Z0);
gammaL = (ZL-Z0)/(ZL+Z0);
gammaIn = s11 + (s12*s21*gammaL)/(1-s22*gammaL);
gammaOut = s22 + (s12*s21*gammaS)/(1-s11*gammaS);
rS = [abs(gammaS), rad2deg(angle(gammaS))];
rL = [abs(gammaL), rad2deg(angle(gammaL))];
rin = [abs(gammaIn), rad2deg(angle(gammaIn))];
rout = [abs(gammaOut), rad2deg(angle(gammaOut))];

%% mencari GT, GP, GA
GT = abs(s21)^2*(1-abs(gammaL)^2)*(1-abs(gammaS)^2);
GT = GT/(abs(1-s11*gammaIn)^2)/(abs(1-gammaOut*gammaL)^2);

GP = abs(s21)^2*(1-abs(gammaL)^2);
GP = GP/(1-abs(gammaIn)^2)/(abs(1-s22*gammaL)^2);

GA = abs(s21)^2*(1-abs(gammaS)^2);
GA = GA/(1-abs(gammaOut)^2)/(abs(1-s11*gammaS)^2);

GT
GTdb = 10*log10(GT)
GP
GPdb = 10*log10(GP)
GA
GAdb = 10*log10(GA)
