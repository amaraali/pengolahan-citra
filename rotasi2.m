% ROTASI2 Melakukan operasi pemutaran citra.
% Versi 2
% Menggunakan pemetaan ke depan
F = imread('kosan.jpg');
[tinggi, lebar] = size(F);
sudut = 5; % Sudut pemutaran
rad = pi * sudut/180;
cosa = cos(rad);
sina = sin(rad);
F2 = double(F);
G=zeros(tinggi, lebar);
for y=1 : tinggi
 for x=1 : lebar
 x2 = round(x * cosa - y * sina);
 y2 = round(y * cosa + x * sina);

 if (x2>=1) && (x2<=lebar) && ...
 (y2>=1) && (y2<=tinggi)
 G(y2, x2) = F2(y, x);
 end
 end
end
G = uint8(G);
figure(1); imshow(G);
clear all;