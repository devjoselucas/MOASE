%% José Lucas Damasceno Holanda
%
%
%% 

clear all;
close all;
clc;

%% Main code

% Instanciando as duas variáveis em formato de matriz
% Matriz M é a tabela 2
% Vetor F é a função que retrata o investimento de cada instituição

[M,F] = instance();

% Cálculo de investimento de cada instituição

[F]   = calcF(M)

% Cálculo da função objetivo

[O] = objetivo(F)

% Para que a função objetivo retorne a mesma ordem de grandeza 
% da função F, calcula-se a raiz de O

o = sqrt(O)