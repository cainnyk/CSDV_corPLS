function [xsnv] = nirSNV(X)
%%%%��׼��̬�����任��Standard Normalized Variate��SNV��
%%%������׾���
[m, n] = size(X);
xsnv = (X-mean(X')'*ones(1,n))./(std(X')'*ones(1,n));
end

