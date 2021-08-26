function [] = melhor_inv(E,F)

k = find(E == min(E))

switch k
    case 1
        fprintf('O melhor investimento foi do IFPB, resuntando em %f \n',F(k));
    case 2
        fprintf('O melhor investimento foi da UEPB, resuntando em %f \n',F(k));
    case 3
        fprintf('O melhor investimento foi da UFCG, resuntando em %f \n',F(k));
    case 4
        fprintf('O melhor investimento foi da UFPB, resuntando em %f \n',F(k));
end

end

