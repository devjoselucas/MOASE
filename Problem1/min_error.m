function [E] = min_error(F,O)

E(length(F)) = 0;

for i=1:length(F)
    E(i)=abs(F(i)-O);
end

end

