function [G_J, c_J] = Jacobi_factorization(A, b)
  N = diag (diag (A));
  P = N - A;
  inv_N = inv (N);
  
  # contruiesc matricea si vectorul de iteratie
  G_J = inv_N * P;
  c_J = inv_N * b;
  
endfunction
