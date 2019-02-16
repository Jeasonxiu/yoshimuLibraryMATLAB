function fig4Paper
% figure��paper�p�ɒ���&�ۑ�


% %% �t�H���g
set(gca,'FontSize',12);
set(gca,'FontName','Times New Roman');
set(gca,'FontWeight','normal'); % normal/demi/bold
 
% %% ���̕�
set(gca,'LineWidth', 1.0); % ��
 
% %% �v���b�g�̐F
clorder = ...
    [255,   0,   0; % ��
       0, 128,   0; % ��
     0,   0, 255; % ��
     204,   8, 204; % ��
     222, 125,   0; % ��
      64,  64,  64];% �Z���D�F  
set(gca,'ColorOrder',clorder/255);
 
% %% �ŏ�����grid off & box on
set(gca,'XGrid','off');
set(gca,'YGrid','off');
set(gca,'ZGrid','off');

% print -depsc2 -tiff fig1.eps
saveas(gcf,'fig1','svg');

end