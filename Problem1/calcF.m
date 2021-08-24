function [F] = calcF(M)

j=0;

    for i=1:4
    
     j=1+3*(i-1);
    
     F(i) = M(1,j  ) + 5*M(2,j  ) + 10*M(3,j  ) +...
          + M(1,j+1) + 5*M(2,j+1) + 10*M(3,j+1) +...
          + M(1,j+2) + 5*M(2,j+2) + 10*M(3,j+2);

    end

end