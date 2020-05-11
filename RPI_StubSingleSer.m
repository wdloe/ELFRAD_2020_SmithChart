clear all;
% RPI Stub Tunggal Serial
%% PARAMETER
ZL = 20+j*50;
Z0 = 50;

%% JANGAN DIGANTI
Y0 = 1/Z0;
RL = real(ZL);
XL = imag(ZL);
YL = 1/ZL;
GL = real(YL);
BL = imag(YL);

%% menghitung t
if GL!=Y0
  t1 = (BL+sqrt(GL*((Y0-GL)^2+BL^2)/Y0))/(GL-Y0);
  t2 = (BL-sqrt(GL*((Y0-GL)^2+BL^2)/Y0))/(GL-Y0);
else
  t1 = -BL/2/Y0;
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

%% Mencari X
X1 = (GL^2*t1-(Y0-BL*t1)*(BL+Y0*t1))/Y0/(GL^2+(BL+Y0*t1)^2);
X2 = (GL^2*t2-(Y0-BL*t2)*(BL+Y0*t2))/Y0/(GL^2+(BL+Y0*t2)^2);

%% Mencari L
Lopen_1 = (1/2/pi)*atan(Z0/X1);
Lshort_1 = (-1/2/pi)*atan(X1/Z0);
Lopen_2 = (1/2/pi)*atan(Z0/X2);
Lshort_2 = (-1/2/pi)*atan(X2/Z0);

%% output
%% KALAU KELUARANNYA MINUS, ABAIKAN
d1
Lopen_1
Lshort_1
d2
Lopen_2
Lshort_2

