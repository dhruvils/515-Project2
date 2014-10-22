function deCas_subdivision( b0, b1, b2, b3, n)
    t = 0.5;
    p = cell(4,4);
    if n > 0
        p{1,1} = b0; p{2,1} = b1; p{3,1} = b2; p{4,1} = b3;
        for i = 2:4
            for j = 1:(5 - i)
                p{j,i} = (1 - t)* p{j,i-1} + t * p{j+1,i-1};
            end
        end
        deCas_subdivision(p{1,1}, p{1,2}, p{1,3}, p{1,4}, n-1);
        deCas_subdivision(p{1,4}, p{2,3}, p{3,2}, p{4,1}, n-1);
    else
        x = [];
        y = [];
        x(1) = b0(1); x(2) = b1(1); x(3) = b2(1); x(4) = b3(1);
        y(1) = b0(2); y(2) = b1(2); y(3) = b2(2); y(4) = b3(2);
        line(x, y)
    end
end

