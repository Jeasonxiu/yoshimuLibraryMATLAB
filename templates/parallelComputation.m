% -------------------------------------------------------------------------------------
%   �ȒP��CPU���񉻂̗�
%   ���񉻂̏����̂��߂ɁC���ʂɌv�Z�����ق����͂₢�H�H
%   5�� 24, 2015 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files:
%-------------------------------------------------------------------------------------

clc

clear variables
close all

parpool
tic
parfor i=1:1024
    A(i) = sin(i*2*pi/1024);
    
end
plot(A)
toc
delete(gcp)


tic
for i=1:1024
    B(i) = sin(i*2*pi/1024);
    
end
figure
plot(A)
toc