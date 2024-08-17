clear;
clc;

n = 30; % Tamanho da matriz
h = 0.1; % Constante

% Laço de inicialização dos vetores x, y e b
for i=1:n
  y(i,1) = 0;
  x(i,1) = 0;
 if i == 1 || i==n
   b(i,1) = 1;
 else
   b(i,1) = 0;
 end
end

% atribuição dos valores da primeira e última linha do sistema
A = [-2*(1 + (h*h)), 1];
A(n,n-1) = 1;
A(n,n) = -2*(1 + (h*h));

%preenchimento da matriz
for i = 2:n-1
  for j=i:i
    A(i, j-1) = 1;
    A(i,j) = -2 * (1 + (h * h));
    A(i, j+1) = 1;
   end
end

a = A; % Atribuição da matriz principal para uma auxiliar

% Eliminação Gaussiana
for k=1:n-1
  for i=k+1:n
    m(i,k)=a(i,k)/a(k,k); %registra em vetor os multiplicadores utilizados para triangular a matriz
    a(i,k)=0;
    for j=k+1:n
      a(i,j)=a(i,j)-m(i,k)*a(k,j);
    end
  end
end

L = eye(n); % Criação da matriz 30x30 com a diagonal igual a 1

% Insere os multiplicadores na parte inferior da matriz L
for i=2:n
  for j=1:i-1
    L(i,j)=m(i,j);
    end
end

U = a;
% Resolução do sistemas lineares L e U
y = L \ b;
x = U \ y

