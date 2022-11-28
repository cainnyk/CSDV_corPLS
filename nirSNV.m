function [xsnv] = nirSNV(X)
%%%%标准正态变量变换（Standard Normalized Variate，SNV）
%%%输入光谱矩阵
[m, n] = size(X);
xsnv = (X-mean(X')'*ones(1,n))./(std(X')'*ones(1,n));
end

