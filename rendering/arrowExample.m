
clear all;
close all;

%% �֐��̒�`
f = (@(x) sqrt(x));     % a�̑J�ڎ����`

%% �֐��̃v���b�g
figure(1);
fplot(@(x) f(x), [0,2], 'b'); hold on;
fplot(@(x) x,[0,2], 'k:')

%% ���^�̏����l�ɑ΂���x�̕ω����v�Z���C�v���b�g (t=0,1,...,T)
T = 10;     % �v�Z������Ԃ̍ŏI����ݒ�
a = zeros(1,T+1);
a(1) = 0.01;    % a�̏����l a(0) ��ݒ�

% a(t) ���J��Ԃ��v�Z���C�ω���}�Ƀv���b�g
for t=1:T
    a(t+1) = f(a(t)); % a(t) �����Ƃ� a(t+1) ���v�Z
    
    figure(1);
    arrow([a(t),a(t)],[a(t),f(a(t))],'Length',8,'Linestyle',':','FaceColor','r');  % a(t)����a(t+1)=sqrt(a(t))�����߂邽�߂̐����Ȗ��������D
    arrow([a(t),f(a(t))],[f(a(t)),f(a(t))],'Length',8,'Linestyle','-','EdgeColor','g','FaceColor','g');  % 45�x�����g����a(t+1)�������Ɏʂ����߂̐����Ȗ��������D
end