function [Hasil] = potong(berkas, f1, f2)
% POTONG Menghasilkan citra dengan level 0 s/d f1
% serta f2-255 dinolkan
Img = imread(berkas);
[tinggi, lebar] = size(Img);

Hasil = Img;

for baris=1 : tinggi
 for kolom=1 : lebar
 if Hasil(baris, kolom) <= f1
 Hasil(baris, kolom) = 0;
 end

 if Hasil(baris, kolom) >= f2
 Hasil(baris, kolom) = 255;
 end
 end
end
