clear all;
% Membuat penguat dengan nilai GA tertentu
%% PARAMETER
s11 = 0.869*exp(j*deg2rad(-159));
s12 = 0.031*exp(j*deg2rad(-9));
s21 = 4.25*exp(j*deg2rad(61));
s22 = 0.507*exp(j*deg2rad(-117));
Ga = 10; #dB

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

%% menggambar di smith chart
%%% titik pusat lingkaran kemantapan beban
CL = conj(s22-Delta*conj(s11))/(abs(s22)^2-abs(Delta)^2);
CL_pol = [abs(CL), rad2deg(angle(CL))];
%%% radius lingkaran kemantapan beban
RL = abs(s12*s21/(abs(Delta)^2-abs(s22)^2));

%%% titik pusat lingkaran kemantapan sumber
CS = conj(s11-Delta*conj(s22))/(abs(s11)^2-abs(Delta)^2);
CS_pol = [abs(CS), rad2deg(angle(CS))];
%%% radius lingkaran kemantapan sumber
RS = abs(s12*s21/(abs(Delta)^2-abs(s11)^2));

CL
CL_pol
RL
CS
CS_pol
RS

%% menghitung nilai gammaOut, gammaL, dan gammaIn
gammaS = 0.51*exp(j*deg2rad(-61)); #silahkan diubah selama berada di dalam Ga
gammaOut = s22 + (s12*s21*gammaS)/(1-s11*gammaS);
gammaL = conj(gammaOut);
gammaIn = s11 + (s12*s21*gammaL)/(1-s22*gammaL);

gammaIn
gammaIn_pol = [abs(gammaIn) rad2deg(angle(gammaIn))]
gammaOut
gammaOut_pol = [abs(gammaOut) rad2deg(angle(gammaOut))]
