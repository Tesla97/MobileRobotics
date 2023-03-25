function defineWindow(xlimits , ylimits , xRectangle , yRectangle , Width , Height)
% Apertura Finestra Di Disegno
clf;
hold on;
grid on;
axis square;
% Settaggio Limiti Assi
xlim([xlimits(1) , xlimits(2)]);
ylim([ylimits(1) , ylimits(2)]);
% Rappresentazione Bordo Mappa
rectangle('Position',[xRectangle yRectangle Width Height],'LineStyle','--');
end