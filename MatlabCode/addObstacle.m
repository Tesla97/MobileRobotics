function addObstacle(xc,yc,Width,Height,r)
% Aggiunta Ostacoli Aumentati ( C-Ostacoli) Alla Mappa
rectangle('Position',[(xc(1)-r) (yc(1)-r) Width(1) Height(1)],'FaceColor',[1 1 1],'LineStyle','--','EdgeColor','m');  
rectangle('Position',[(xc(2)-r) (yc(2)-r) Width(2) Height(2)],'FaceColor',[1 1 1],'LineStyle','--','EdgeColor','m'); 
rectangle('Position',[(xc(3)-r) (yc(3)-r) Width(3) Height(3)],'FaceColor',[1 1 1],'LineStyle','--','EdgeColor','m'); 

% Rappresentazione Ostacoli Non Aumentati
rectangle('Position',[xc(1) yc(1) Width(1)-r*2 Height(1)-2*r],'FaceColor',[0 0 1]); 
rectangle('Position',[xc(2) yc(2) Width(2)-r*2 Height(2)-2*r],'FaceColor',[0 0 1]); 
rectangle('Position',[xc(3) yc(3) Width(3)-r*2 Height(3)-2*r],'FaceColor',[0 0 1]); 

% Aggiungi Vertici Ostacoli e Ambiente
% xVertici = [xc(1)-r;xc(1)-r;xc(1)-r+Width(1);xc(1)-r+Width(1);
%             xc(2)-r;xc(2)-r;xc(2)-r+Width(2);xc(2)-r+Width(2);
%             xc(3)-r;xc(3)-r;xc(3)-r+Width(3);xc(3)-r+Width(3);
%             -35;-35+70;-35;-35+70];
%         
% yVertici = [yc(1)-r;yc(1)-r+Height(1);yc(1)-r;yc(1)-r+Height(1);
%             yc(2)-r;yc(2)-r+Height(2);yc(2)-r;yc(2)-r+Height(2);
%             yc(3)-r;yc(3)-r+Height(3);yc(3)-r;yc(3)-r+Height(3);
%             -35;-35;-35+70;-35+70];
%         
% plot(xVertici,yVertici,'g*','LineWidth',2);
end