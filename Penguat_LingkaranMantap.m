clear all;
% PENGUAT NOMOR 2
%% PARAMETER
s11 = 0.5*exp(j*deg2rad(-180));
s12 = 2.5*exp(j*deg2rad(70));
s21 = 0.08*exp(j*deg2rad(30));
s22 = 0.8*exp(j*deg2rad(-100));

f = 1.9e9;

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

printf("\n");
printf("Kemantapan Beban \n");
CL
CL_pol
RL
printf("\n");
printf("Kemantapan Sumber \n");
CS
CS_pol
RS
