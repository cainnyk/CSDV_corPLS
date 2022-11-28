clc
clear

load('corn_m51.mat')
X;                      %����
y;                      %����

% figure
% plot(1101:2:2500, X(:, 1:length(X)));
% xlabel('Wavelength/nm','FontName','Times New Roman','FontSize',8);
% ylabel('Absorbance','FontName','Times New Roman','FontSize',8);
% set(gca,'FontName','Times New Roman','FontSize',8);

% X =  nirSNV(X);

ratio = 0.7;            % ѵ����ռ70%  
[mx, nx] = size(X);
mtrain = ceil(mx * ratio);
mtest = mx - mtrain;
[Xtrain, Xtest, Ytrain, Ytest] = ks(X,y,ceil(mx*ratio));


[Rc,RMSEC,beta,yc] = fitaaa(Xtrain, Ytrain);
[Rp,RMSEP,yp] = fitbbb(Xtest,Ytest,beta);

%% �������ϵ��ѡ�����������ٽ�ģ
rt = CA(Xtrain, Ytrain);
max_rt = max(rt);
min_rt = min(rt);


[Rc_,RMSEC_,Rp_,RMSEP_,selectedBands] = CA_get_i(Xtrain, Ytrain, Xtest, Ytest,min_rt, max_rt, 0.001);