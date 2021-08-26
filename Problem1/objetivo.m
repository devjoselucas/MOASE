function [O] = objetivo(F)

O = (F(1)-F(2))^2 +...
  + (F(1)-F(3))^2 +...
  + (F(1)-F(4))^2 +...
  + (F(2)-F(3))^2 +...
  + (F(2)-F(4))^2 +...
  + (F(3)-F(4))^2 ;

O = sqrt(O);

end