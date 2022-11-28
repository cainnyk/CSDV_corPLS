function [R,RMSEC,beta,y] = fitaaa(XX, YY)     %��Ӧ�Ⱥ���

    f = 7;
    %z = 20*i+1;

    [xl,yl,xs,ys,beta,pctvar,mse]=plsregress(XX,YY,f);%��xr��Y����pls�ع�
    RMSEC = sqrt(sum((YY-(XX*beta(2:end,:)+beta(1,:))).^2)/50);
    y = XX*beta(2:end,:)+beta(1,:);
    R = sqrt(1-(sum((YY-(XX*beta(2:end,:)+beta(1,:))).^2))/(sum((YY-mean(YY)).^2)));

    z = R/(1+RMSEC);
end