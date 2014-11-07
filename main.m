function main()
[x, y] = ginput;

% uncomment the line below for the de_boor control points
%cs = de_boor([x, y], length(x)-1);

for i = 1:6
    %deCas_subdivision([1 1], [3 3], [5 5], [7 2], i);
    %deCas_subdivision_m([1 1;3 3;5 5;7 2;9 1; 10 3], i, true);
    
    % uncomment the line below for decasteljau subdivision with four points
    deCas_subdivision([x(1), y(1)], [x(2),y(2)], [x(3),y(3)], [x(4),y(4)], i);
    
    % likewise, but not restrained to four points
    %deCas_subdivision_m([x,y], i, true);
end


