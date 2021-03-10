function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
   sz = length (G_rowptr) - 1;
   x0 = zeros (sz,1);
   prev_x = x0;
   
   while 1
     y = csr_multiplication (G_values, G_colind, G_rowptr, prev_x);
     x = y + c;
     err = norm (x - prev_x);
     if err < tol
       return 
     endif
     prev_x = x;
   endwhile
   
endfunction