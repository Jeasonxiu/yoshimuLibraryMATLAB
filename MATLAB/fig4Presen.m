function fig4Presen
% figureをプレゼンテーション用に調整&保存


% %% フォント
set(gca,'FontSize',28);
set(gca,'FontName','Helvetica');
set(gca,'FontWeight','normal'); % normal/demi/bold
 
% %% 線の幅
set(gca,'LineWidth', 1.5); % 軸
 
% %% プロットの色
clorder = ...
    [  0,   0, 255; % 青
       0, 128,   0; % 緑
     255,   0,   0; % 赤
     204,   8, 204; % 紫
     222, 125,   0; % 茶
       0,  51, 153; % 紺 (青と区別しづらい，注意！)
      64,  64,  64];% 濃い灰色  
set(gca,'ColorOrder',clorder/255);
 
% %% 最初からgrid on & box on
set(gca,'XGrid','on');
set(gca,'YGrid','on');
set(gca,'ZGrid','on');

% print -depsc2 -tiff fig1.eps
saveas(gcf,'fig1','svg');

end