function main()
[x, y] = ginput;

cs = de_boor([x, y], length(x)-1);

for i = 1:6
    %deCas_subdivision([1 1], [3 3], [5 5], [7 2], i);
    %deCas_subdivision_m({[1 1] [3 3] [5 5] [7 2] [9 1] [10 3]}, i);
end


