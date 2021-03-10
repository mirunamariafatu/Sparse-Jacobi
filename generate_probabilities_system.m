function [A, b] = generate_probabilities_system(rows)
  n = rows * (rows + 1) / 2;
  b = zeros (n,1);
  A = zeros (n);
  
 # parcurgem prima linie 
  for k = 2:3
  A(1,1) = 4;
  A(1,k) = -1;
  endfor

 # parcurgem mijlocul labirintului
  poz = 2;
  for i = 2 : rows - 1
    A(poz, poz) = 5;
    
    A(poz, poz-(i -1))= -1;
    A(poz, poz+1) = -1;
    A(poz, poz +i) = -1;
    A(poz, poz+i+1) = -1;
    
   for j = 2 : i - 1
     m = poz + 1;
     while (m < poz + i - 1)
      A(m, m) = 6 ;
      A(m, m-i) = -1;
      A(m, m-i+1) = -1;
      A(m, m+1) = -1;
      A(m, m-1) = -1;
      A(m, m+i) = -1;
      A(m, m+i+1) = -1;
      m++;
      endwhile
    endfor
    poz = poz + i -1;
      A(poz,poz) = 5;
      A(poz, poz-i) = -1;
      A(poz, poz-1) = -1;
      A(poz, poz+i) = -1;
      A(poz, poz +i+1) = -1;
      
      poz++;
  endfor
  
  # pacurgem ultima linie
  
  i++;
  for b1 = poz:n
    b(b1) = 1; # iesirile cu "food"
  endfor
  
  u = poz;
  while (u <= n)
    A(u, u) = 4;
    A(u, u-i+1) = -1;
    A(u, u+1) = -1;
    u1 = u+1;
    while( u1 < u + i - 1)
    A(u1, u1) = 5;
    A(u1, u1-i) = -1;
    A(u1, u1-i+1) = -1;
    A(u1, u1-1) = -1;
    A(u1, u1+1) = -1;
    u1++;
    endwhile
    u = u + i - 1;
    A(u, u) = 4;
    A(u, u-i) = -1;
    A(u, u-1) = -1;
    u++;
  endwhile
  
endfunction