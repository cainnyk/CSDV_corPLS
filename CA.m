function rt = CA(X,Y)
%Ƥ��ѷ���ϵ��
[Mx,Nx]=size(X);%������*��������
colMeanX=mean(X,1);
meanY=mean(Y);
sumUp=0;
sumDown1=0;
sumDown2=0;
rt=zeros(Nx,1);
for j=1:Nx   %800��
    sumUp=0;
    sumDown1=0;
    sumDown2=0;
    for i=1:Mx   %105��
        sumUp=sumUp+(X(i,j)-colMeanX(j))*(Y(i)-meanY);%ÿһ��ÿ����ÿ��x���ֵ�Ĳ����y���ֵ�Ĳ� ֮��
        sumDown1=sumDown1+(X(i,j)-colMeanX(j))*(X(i,j)-colMeanX(j));%ÿһ��ÿ��������о�ֵ�Ĳ��ƽ�� ֮��
        sumDown2=sumDown2+(Y(i)-meanY).*(Y(i)-meanY);%%%ÿһ��y�ķ���  ֮��
    end
sumDown=sqrt(sumDown1*sumDown2);
rt(j)=sumUp/sumDown;%���ϵ����Խ��Խ�ã�-1<x<1;
end



