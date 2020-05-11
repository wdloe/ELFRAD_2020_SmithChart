clear all;
% dengan Noise Figure
%% PARAMETER :
s11 = 0.6*exp(j*deg2rad(-60));
s21 = 1.9*exp(j*deg2rad(81));
s12 = 0.05*exp(j*deg2rad(26));
s22 = 0.5*exp(j*deg2rad(-60));
Rn = 20; #ohm
gammaOpt = 0.62*exp(j*deg2rad(100));
NFdb = 1.8; Fidb = NFdb;
Fmindb = 1.6;
Ga = 8; %dB
Z0 = 50;

%% Oke. Mari kita kerjain.

%% menentukan kemantapan transistor
Delta = s11*s22 - s12*s21;
K = (1-abs(s11)^2-abs(s22)^2+abs(Delta)^2)/2/abs(s12*s21);

if abs(Delta)<1 && K>1
  printf("MANTAP TANPA SYARAT \n");
else
  printf("MANTAP BERSYARAT \n");
endif
K
absDelta=abs(Delta)

linGa = 10^(Ga/10);
ga = linGa/(abs(s21)^2);

%% mengihitung CA, rA, dan gambar lingkaran GA konstan
ra = sqrt(1-2*K*abs(s21*s12)*ga+abs(s12*s21)^2*ga^2);
ra = ra/abs(1+ga*(abs(s11)^2-abs(Delta)^2));
C1 = s11-Delta*conj(s22);
Ca = ga*conj(C1)/(1+ga*(abs(s11)^2-abs(Delta)^2));

Ca
Ca_pol = [abs(Ca) rad2deg(angle(Ca))]
ra

%% cek syarat noise figure
Fi = 10^(Fidb/10);
Fmin = 10^(Fmindb/10);

rn = Rn/Z0;
Ni = (Fi-Fmin)/(4*rn) * abs(1+gammaOpt)^2;

%%% titik pusat dan radius lingkaran faktor derau konstan
CFi = gammaOpt/(1+Ni);
rFi = 1/(1+Ni) * sqrt(Ni^2 + Ni*(1-abs(gammaOpt)^2));

Fi
Fmin
rn
Ni
CFi
CFi_pol = [abs(CFi) rad2deg(angle(CFi))]
rFi


%% menentukan gammaS -> ada di lingkaran GA konstan
%% asal berpotongan atau berada di dalam lingkaran F konstan
gammaS = 0.6*exp(j*deg2rad(86));
gammaOut = s22 + (s12*s21*gammaS)/(1-s11*gammaS);
gammaL = conj(gammaOut);
gammaIn = s11 + (s12*s21*gammaL)/(1-s22*gammaL);

gammaIn
gammaIn_pol = [abs(gammaIn) rad2deg(angle(gammaIn))]
gammaOut
gammaOut_pol = [abs(gammaOut) rad2deg(angle(gammaOut))]
