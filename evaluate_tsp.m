function [fit,bestlen] = evaluate_tsp(chro,pop)

displace =[chro, chro(:,1)];
displace = displace(:,2:size(displace,2));
xdis = power((pop.cityX(chro)-pop.cityX(displace)),2);
ydis = power((pop.cityY(chro)-pop.cityY(displace)),2);
dis = sum(sqrt(xdis + ydis),2);
bestlen = min(dis);
fit = 1 ./ exp(zscore(dis));