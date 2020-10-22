clear all
close all


pop.size = 20;
pop.gen = 0;
pop.maxGen = 100;
% 杂交率
pop.pc = .6;
% 变异率
pop.pm = .3;
% 编码位数

[index,x,y]=textread('mona-lisa100K.tsp.txt','%d %d %d');
pop.citynum = size(x,1);
pop.cityX = x;
pop.cityY = y;
fig = figure(1);
set(fig,'position',[100 100 1000 600]);

plot(x,y,'k.','MarkerSize',1,'LineWidth',2);
hold on
pop=initialize_tsp(pop);
plot(pop.cityX(pop.bestChro),pop.cityY(pop.bestDisplay), 'k','LineWidth',0.1);
minlen = pop.bestlen;
for i = 1:pop.maxGen
    pop = newPop_tsp(pop);
    figure(1)
    minlen = min(minlen, pop.bestlen);
    title("Gen: " + num2str(i) + " CurrentBest " + num2str(pop.bestlen) + "   Best: " + num2str(pop.bestlen));
    plot(x,y,'k.','MarkerSize',1,'LineWidth',2);
    hold on
    plot(pop.cityX(pop.bestChro),pop.cityY(pop.bestDisplay), 'k','LineWidth',0.1);
    pause(0.05)
end


