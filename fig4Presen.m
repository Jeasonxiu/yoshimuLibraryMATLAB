function fig4Presen
% figure���v���[���e�[�V�����p�ɒ���&�ۑ�


% %% �t�H���g
set(gca,'FontSize',28);
set(gca,'FontName','Helvetica');
set(gca,'FontWeight','normal'); % normal/demi/bold
 
% %% ���̕�
set(gca,'LineWidth', 1.5); % ��
 
% %% �v���b�g�̐F
clorder = ...
    [  0,   0, 255; % ��
       0, 128,   0; % ��
     255,   0,   0; % ��
     204,   8, 204; % ��
     222, 125,   0; % ��
       0,  51, 153; % �� (�Ƌ�ʂ��Â炢�C���ӁI)
      64,  64,  64];% �Z���D�F  
set(gca,'ColorOrder',clorder/255);
 
% %% �ŏ�����grid on & box on
set(gca,'XGrid','on');
set(gca,'YGrid','on');
set(gca,'ZGrid','on');

print -depsc2 -tiff fig1.eps

end