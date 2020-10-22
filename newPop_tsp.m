function pop = newPop_tsp(pop)

pop.gen = pop.gen+1;
pop = selection(pop);
% pop = crossover(pop);
pop = opt(pop);
pop = mutation(pop);

[pop.fit, pop.bestlen] = evaluate_tsp(pop.chro,pop);

n = find(pop.fit == max(pop.fit),1);
pop.bestChro = pop.chro(n,:);
pop.bestDisplay = [pop.bestChro, pop.bestChro(1)];
pop.bestDisplay = pop.bestDisplay(2:length(pop.bestDisplay));
pop.bestFit = pop.fit(n,:);

%------------------------------------------------------------
function pop = selection(pop)
p = pop.fit;
p = p-min(p);
p = p+0.01*max(p);
if max(p)==min(p)
    p(:) = 1;
end

p = p/sum(p);
p = cumsum(p);

bestindex = find(pop.fit == max(pop.fit),1);
for i = 1:length(p)
    if i < length(p)/4
        n(i)=bestindex;
    else
        n(i) = find(p>=rand,1);
    end
end
pop.chro = pop.chro(n,:);
pop.fit = pop.fit(n,:);

%------------------------------------------------------------
function pop = crossover(pop)

for i = 1:2:pop.size
    if rand<pop.pc
        c1 = pop.chro(i,:);
        c2 = pop.chro(i+1,:);
        n = ceil(rand*(length(c1)-1));
        pop.chro(i,n+1:end) = c2(n+1:end);
        pop.chro(i+1,n+1:end) = c1(n+1:end);
    end
end

%------------------------------------------------------------
function pop = opt(pop)

for i = 1:pop.size
   pop.chro(i)=Opt2(pop.chro(i),pop);
end

%------------------------------------------------------------
function pop = mutation(pop)

for i = 1:1:pop.size
    if rand<pop.pm
        n1 = ceil(rand*(size(pop.chro,2))/2);
        n2 = ceil(rand*(size(pop.chro,2))/2) + ceil(size(pop.chro,2))/2;
        pop.chro(i,n1:n2) = flip(pop.chro(i,n1:n2));
    end
end
