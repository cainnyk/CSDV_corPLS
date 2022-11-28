function rt = CA(X,Y)
%皮尔逊相关系数
[Mx,Nx]=size(X);%样本数*波长点数
colMeanX=mean(X,1);
meanY=mean(Y);
sumUp=0;
sumDown1=0;
sumDown2=0;
rt=zeros(Nx,1);
for j=1:Nx   %800列
    sumUp=0;
    sumDown1=0;
    sumDown2=0;
    for i=1:Mx   %105行
        sumUp=sumUp+(X(i,j)-colMeanX(j))*(Y(i)-meanY);%每一列每个数每个x与均值的差乘以y与均值的差 之和
        sumDown1=sumDown1+(X(i,j)-colMeanX(j))*(X(i,j)-colMeanX(j));%每一列每个数与该列均值的差的平方 之和
        sumDown2=sumDown2+(Y(i)-meanY).*(Y(i)-meanY);%%%每一行y的方差  之和
    end
sumDown=sqrt(sumDown1*sumDown2);
rt(j)=sumUp/sumDown;%相关系数，越大越好，-1<x<1;
end



