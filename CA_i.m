function selIndex = CA_i(X,Y,cutfValue)
%选出大于阈值cutfValue的所有波段
[Mx,Nx]=size(X);%样本数*波长点数
rt=CA(X,Y);
selNum=0;
for i=1:Nx
    if(rt(i)>cutfValue)
      selNum=selNum+1;
    end
end
selIndex=zeros(selNum,1);
selrt=zeros(selNum,1);
indexDistr=zeros(Nx,1);
count=0;
for i=1:Nx
    if(rt(i)>cutfValue)
      count=count+1;
      selIndex(count)=i;
      selrt(count)=rt(i);
      indexDistr(i)=1;
    end
end
selSpec=X(:,selIndex);


