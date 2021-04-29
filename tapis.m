function [G] = tapis(berkas, H)
% TAPIS Menerapkan filter H dengan citra F
% H harus mempunyai tinggi dan lebar ganjil
% Hasil: citra G

F = imread(berkas);
K = konvolusi(F, H);
G = uint8(K);

figure(1); imshow(F);
figure(2); imshow(G);