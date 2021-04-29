## Copyright (C) 2021 ASUS
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} twirl (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ASUS <ASUS@LAPTOP-Q8MV085B>
## Created: 2021-04-15

function G = twirl(F)
  dimensi = size(F);
  tinggi = dimensi(1);
  lebar = dimensi(2);
  xc = round(lebar / 2);
  yc = round(tinggi / 2);
  
  alpha = 43 * pi / 180;
  rmaks = 0.5 * sqrt(xc^2 + yc ^ 2);
  
  for y=1 : tinggi
    for x=1 : lebar
      r = sqrt((x-xc)^2+(y-yc)^2);
      beta = atan2(y-yc, x-xc) + alpha * (rmaks - r) / rmaks;
      x2 = xc + r * cos(beta);
      y2 = yc + r * sin(beta);
      
      if (x2>=1) && (x2<=lebar) && (y2>=1) && (y2<=tinggi)
        %Interpolasi bilinear
        p = floor (y2);
        q = floor (x2);
        a = y2-p;
        b = x2-q;
        
        if (floor(x2)==lebar) || (floor(y2) == tinggi)
          G(y, x) = F(floor(y2), floor(x2));
        else
          intensitas = (1-a)*((1-b)*F(p,q) + b * F(p, q+1)) + ...
          a *((1-b)* F(p+1, q) +  b * F(p+1, q+1));
          
          G(y, x) = intensitas;
        endif
      else
        G(y, x) = 0;
      endif
    endfor
  endfor
  G = uint8(G);
endfunction
