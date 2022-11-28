function  [Rc_,RMSEC_,Rp_,RMSEP_,selectedBands] = CA_get_i(Xtrain, Ytrain,Xtest, Ytest,min_rt, max_rt, gap)
%%�������ϵ�������е�CA_PLS_ceshi�е�i
rpp = -0.1;

for i = (min_rt - 0.1) : gap : (max_rt - 0.1)
    selIndex = CA_PLS_ceshi(Xtrain,Ytrain,i);
    
    [Rc,RMSEC,beta,yc] = fitaaa(Xtrain(:,selIndex), Ytrain);
    [Rp,RMSEP,yp] = fitbbb(Xtest(:,selIndex), Ytest,beta);
    
    if Rp > rpp
        rpp = Rp;
        selectedBands = selIndex;%����ѡ��Ĳ���
        i 
    end
end

[Rc_,RMSEC_,beta,yc] = fitaaa(Xtrain(:,selectedBands), Ytrain);
[Rp_,RMSEP_,yp] = fitbbb(Xtest(:,selectedBands),Ytest,beta);

end

