clear all;
% RPI 2 Komponen Diskrit
%% PARAMETER
ZL = 14+j*-85;
Z0 = 50;
f = 1e9;

%% JANGAN DIGANTI
RL = real(ZL);
XL = imag(ZL);
w = 2*pi*f;

if RL>Z0
  B1 =(XL+sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL))/(RL^2+XL^2);
  B2 =(XL-sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL))/(RL^2+XL^2);
  X1 = 1/B1 + (XL*Z0)/RL - Z0/(B1*RL);
  X2 = 1/B2 + (XL*Z0)/RL - Z0/(B2*RL);
else %RL<Z0
  B1 = sqrt((Z0-RL)/RL)/Z0;
  B2 = -sqrt((Z0-RL)/RL)/Z0;
  X1 = sqrt(RL*(Z0-RL))-XL;
  X2 = -sqrt(RL*(Z0-RL))-XL;
endif

%% Menghitung nilai komponen
%%% buat baca hasilnya, supaya gk bingung -> genap-genap atau ganjil-ganjil

if B1>0 #kapasitor
  C1 = B1/w;
else #induktor
  L1 = -1/B1/w;
endif

if B2>0 #kapasitor
  C2 = B2/w;
else #induktor
  L2 = -1/B2/w;
endif
  
if X1>0 #induktor
  L3 = X1/w;
else #capacitor
  C3 = -1/X1/w;
endif

if X2>0 #induktor
  L4 = X2/w;
else #capacitor
  C4 = -1/X2/w;
endif


  
