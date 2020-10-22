function pop = initialize_tsp(pop)

pop.chro = rand(pop.size,pop.citynum);
for i=1:pop.size
    pop.chro(i,:) = randperm(pop.citynum);
end

[pop.fit,pop.bestlen] = evaluate_tsp(pop.chro,pop);
n = find(pop.fit == max(pop.fit),1);
pop.bestChro = pop.chro(n,:);
pop.bestDisplay = [pop.bestChro, pop.bestChro(1)];
pop.bestDisplay = pop.bestDisplay(2:length(pop.bestDisplay));
pop.bestFit = pop.fit(n,:);