clear all;
% RPI Stub Tunggal Paralel
%% PARAMETER
ZL = 80+j*40;
Z0 = 50;

%% JANGAN DIGANTI
Y0 = 1/Z0;
RL = real(ZL);
XL = imag(ZL);
YL = 1/ZL;
GL = real(YL);
BL = imag(YL);

%% menghitung t
if RL!=Z0
  t1 = (XL+sqrt(RL*((Z0-RL)^2+XL^2)/Z0))/(RL-Z0);
  t2 = (XL-sqrt(RL*((Z0-RL)^2+XL^2)/Z0))/(RL-Z0);
else
  t1 = -XL/2/Z0;
  t2 = t1;
endif

%% mencari d (dalam LAMBDA)
if t1>=0
  d1 = (1/2/pi)*atan(t1); #dalam lambda
else
  d1 = (1/2/pi)*(pi+atan(t1));
endif

if t2>=0
  d2 = (1/2/pi)*atan(t2);
else
  d2 = (1/2/pi)*(pi+atan(t2));
endif

%% Mencari B
B1 = (RL^2*t1-(Z0-XL*t1)*(XL+Z0*t1))/Z0/(RL^2+(XL+Z0*t1)^2);
B2 = (RL^2*t2-(Z0-XL*t2)*(XL+Z0*t2))/Z0/(RL^2+(XL+Z0*t2)^2);

%% Mencari L
Lopen_1 = (-1/2/pi)*atan(B1/Y0);
Lshort_1 = (1/2/pi)*atan(Y0/B1);
Lopen_2 = (-1/2/pi)*atan(B2/Y0);
Lshort_2 = (1/2/pi)*atan(Y0/B2);

%% output
%% KALAU KELUARANNYA MINUS, ABAIKAN
d1
Lopen_1
Lshort_1
d2
Lopen_2
Lshort_2

