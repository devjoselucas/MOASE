%% Exemplo 01

clc;
clear;
close;

%%

global dist maxDist
%coordenadas das 9 cidades (geração aleatória entre 0 e 1).
x=[0.9501,0.2311,0.6068,0.4860,0.8913,0.7621,0.4565,0.0185,0.8214];
y=[0.4103,0.8937,0.0579,0.3529,0.8132,0.0098,0.1389,0.2028,0.1987];
%construção da matriz de distâncias.
%determinação da maior distância entre cidades.
for i=1:9
    for j=1:9
        dist(i,j)=sqrt((x(i)-x(j))^2+(y(i)-y(j))^2);
    end
end
%%
maxDist=ceil(max(max(dist)));
%criação da população incial por mutação.
cromo(1,:)=1:8;
l(1)=comp(cromo(1,:));

%%
for i=2:40
    cromo(i,:)=cromo(i-1,:);
    um=round(1+7*rand);
    outro=round(1+7*rand);
    if um>outro
        aux=um;um=outro;outro=aux;
    end
    cromo(i,um:outro)=fliplr(cromo(i,um:outro));
    l(i)=comp(cromo(i,:));
end

%%
%hetereogenidade da população inicial.
lmed=mean(l);
iap=sqrt(sum((l(i)/lmed-1).^2));
[lMin,i]=min(l);
disp([sprintf('%4d;',0),sprintf('%1d;',cromo(i,:)),...
    sprintf('%7.4f;',lMin),sprintf('%10.2e',iap)])
plot(x([9,cromo(i,:),9]),y([9,cromo(i,:),9]))
figure
%crescimento da população.

%%
for jj=1:10
    for j=1:200 %começo da geração.
        %população auxiliar: formação por cruzamentos.
        for i=42:2:60
            pais=round(1+39*rand(2,1));
            corte=round(1+6*rand);
            cromo(i-1,:)=[cromo(pais(1),1:corte),cromo(pais(2),corte+1:8)];
            cromo(i,:)=[cromo(pais(2),1:corte),cromo(pais(1),corte+1:8)];
            l(i-1)=comp(cromo(i-1,:));
            l(i)=comp(cromo(i,:));
        end
        %seleção.
        ate=60;
        for k=1:20 %reduzir a população a 40 indivíduos,
            ate=ate-1; %exterminando os perdedores de 20
            um=round(1+ate*rand); %competições entre pares de indivíduos
            outro=round(1+ate*rand); %escolhidos aleatóriamente.
            morre=um;
            if l(outro)>l(um)
                morre=outro;
                
                
                
            end
            cromo(morre,:)=[];
            l(morre)=[];
        end
        %mostrar um ótimo local evetualmente encontrado.
        lmed=mean(l);
        iap=sqrt(sum((l/lmed-1).^2));
        if iap<5e-15
            [lMin,i]=min(l);
            disp([sprintf('%4d;',j),sprintf('%1d;',cromo(i,:)),...
                sprintf('%7.4f;',lMin),sprintf('%10.2e',iap)])
            figure(2)
            plot(x([9,cromo(1,:),9]),y([9,cromo(1,:),9]))
            pause(1)
        end
        %mutação: permutação entre os genes 'um' e 'outro' do cromossomo 'i'.
        for k=1:2
            i=round(1+39*rand);
            um=round(1+7*rand);
            outro=round(1+7*rand);
            aux=cromo(i,um);
            cromo(i,um)=cromo(i,outro);
            cromo(i,outro)=aux;
            l(i)=comp(cromo(i,:));
        end
    end
    %mutação: permutação entre os genes 'um' e 'outro' do cromossomo 'i'.
    for k=1:2
        i=round(1+39*rand);
        um=round(1+7*rand);
        outro=round(1+7*rand);
        aux=cromo(i,um);
        cromo(i,um)=cromo(i,outro);
        cromo(i,outro)=aux;
        l(i)=comp(cromo(i,:));
    end
end

%%
function l=comp(cidades)
global dist maxDist
%comprimento de um determinado caminho
%que começa e termina na cidade 1.
l=dist(9,cidades(1));
for i=2:8
    l=l+dist(cidades(i-1),cidades(i));
end
l=l+dist(cidades(8),9);
%penalização do caminho se ele não é viável.
aux=zeros(size(cidades));
for i=cidades
    aux(i)=maxDist;
end
l=l+maxDist*8-sum(aux);
end