function [values, colind, rowptr] = matrix_to_csr(A)
  nr = length (A);
  n = nnz(A);
  values = zeros (1,n);
  colind = zeros (1,n);
  rowptr = zeros (1,nr+1);
  k = 1;
  idx = 1;
  idx1 = 0;
  l =1;
  c =1;
 
  # construiesc vectorii values si colind 
  for i = 1:nr
    for j = 1:nr
      if A(i,j) != 0
        values(k) = A(i,j);
        colind(k) = j;
        k++; 
      endif
    endfor
  endfor
  
  # construiesc vectorul rowptr
  for i1 = 1:nr
    rowptr(idx) = idx1+1; #retinem pointerul la primul numar != 0 de pe fiecare rand
    idx++;
    for j1 = 1:nr
      if A(i1,j1) != 0
        idx1++;
      endif
    endfor
  endfor
 rowptr(nr+1) = n + 1;
  
endfunction