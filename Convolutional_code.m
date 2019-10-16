##Randombits = 2*(rand(1,1024) > 0.5)-1;
Randombits = [1 1 1 0 1 1 0 1 0 0 1 1 1 0 0 1];
ip = [0 0 Randombits];
for m=3:length(ip)
  Output1 = xor(ip(m),ip(m-1),ip(m-2))
  Output2 = xor(ip(m),ip(m-2))
endfor

trellis = poly2trellis([3],[7 5]);
code = convenc(Randombits,trellis)
