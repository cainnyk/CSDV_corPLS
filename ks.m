function [Xtrain,Xtest,Ytrain,Ytest] = ks(X,Y,Num)
%  ks selects the samples XSelected which uniformly distributed in the exprimental data X's space
%  Input 
%         X:the matrix of the sample spectra
%         Num:the number of the sample spectra you want select 
%  Output
%         XSelected:the sample spectras was selected from the X
%         XRest:the sample spectras remain int the X after select
%         vSelectedRowIndex:the row index of the selected sample in the X matrix     
%  Programmer: zhimin zhang @ central south university on oct 28 ,2007


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% start of the kennard-stone step one
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nRow,nCol]=size(X); % obtain the size of the X matrix
mDistance=zeros(nRow,nRow); %dim a matrix for the distance storage
vAllofSample=1:nRow;
tic
for i=1:nRow-1
    
    vRowX=X(i,:); % obtain a row of X
    
    for j=i+1:nRow
        
        vRowX1=X(j,:); % obtain another row of X        
        mDistance(i,j)=norm(vRowX-vRowX1); % calc the Euclidian distance       
        
    end
    
end
toc

[vMax,vIndexOfmDistance]=max(mDistance);

[nMax,nIndexofvMax]=max(vMax);


%vIndexOfmDistance(1,nIndexofvMax)
%nIndexofvMax
vSelectedSample(1)=nIndexofvMax;
vSelectedSample(2)=vIndexOfmDistance(nIndexofvMax);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end of the kennard-stone step one
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% start of the kennard-stone step two
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=3:Num
    vNotSelectedSample=setdiff(vAllofSample,vSelectedSample);
    vMinDistance=zeros(1,nRow-i + 1);
    
    
    for j=1:(nRow-i+1)
        nIndexofNotSelected=vNotSelectedSample(j);
        vDistanceNew = zeros(1,i-1);
        
        for k=1:(i-1)
            nIndexofSelected=vSelectedSample(k);
            if(nIndexofSelected<=nIndexofNotSelected)
                vDistanceNew(k)=mDistance(nIndexofSelected,nIndexofNotSelected);
            else
                vDistanceNew(k)=mDistance(nIndexofNotSelected,nIndexofSelected);    
            end                       
        end
        
        vMinDistance(j)=min(vDistanceNew);
    end
    
    [nUseless,nIndexofvMinDistance]=max(vMinDistance);
    vSelectedSample(i)=vNotSelectedSample(nIndexofvMinDistance);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% end of the kennard-stone step two
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% start of export the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vSelectedRowIndex=vSelectedSample;

for i=1:length(vSelectedSample)
   
    Xtrain(i,:)=X(vSelectedSample(i),:);
    Ytrain(i,:)=Y(vSelectedSample(i),:);
    
end

vNotSelectedSample=setdiff(vAllofSample,vSelectedSample);
for i=1:length(vNotSelectedSample)
   
    Xtest(i,:)=X(vNotSelectedSample(i),:);
    Ytest(i,:)=Y(vNotSelectedSample(i),:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% end of export the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
