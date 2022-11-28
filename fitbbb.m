function [R,RMSEP,y] = fitbbb(XX,YY,beta)     %ÊÊÓ¦¶Èº¯Êý

   
    RMSEP = sqrt(sum((YY-(XX*beta(2:end,:)+beta(1,:))).^2)/28);
    y = XX*beta(2:end,:)+beta(1,:);
    R = sqrt(1-(sum((YY-(XX*beta(2:end,:)+beta(1,:))).^2))/(sum((YY-mean(YY)).^2)));

    z = R/(1+RMSEP);
end