function p = Opt2(p,pop)
n = numel(p);
zmin = -1;
while zmin < 0
    zmin = 0;
    i = 0;
    b = p(n);
    while i < n-2
        a = b;
        i = i+1;
        b = p(i);
        Dab = D(a,b,pop);
        j = i+1;
        d = p(j);
        while j < n
            c = d;
            j = j+1;
            d = p(j);
            z = (D(a,c,pop) - D(c,d,pop)) + D(b,d,pop) - Dab;
            if z < zmin
                zmin = z;
                imin = i;
                jmin = j;
            end
        end
    end
    if zmin < 0
        p(imin:jmin-1) = p(jmin-1:-1:imin);
    end
end

%------------------------------------------------------------
function dis = D(a,b,pop)

dis = sqrt(pow(pop.cityX(a)-pop.cityX(b),2)+pow(pop.cityY(a)-pop.cityY(b),2));