function deCas_subdivision_m(control_points, n, convert)
    if convert
        x = {};
        for i=1:length(control_points)
            x{i} = control_points(i,:);
        end
        control_points = x;
    end
    t = 0.5;
    num_ctrl_points = length(control_points);
    p = cell(num_ctrl_points, num_ctrl_points);
    ud = {};
    ld = {};
    if n > 0
        %p{1,1} = b0; p{2,1} = b1; p{3,1} = b2; p{4,1} = b3;
        for i = 1: num_ctrl_points
            p{i, 1} = control_points{i};
        end
        for i = 2:(num_ctrl_points + 1)
            for j = 1:((num_ctrl_points + 1) - i)
                p{j,i} = (1 - t)* p{j,i-1} + t * p{j+1,i-1};
            end
        end
        j = num_ctrl_points;
        for i = 1: (num_ctrl_points)
            ud{i} = p{1, i};
            ld{i} = p{i, j};
            j = j - 1;
        end
        deCas_subdivision_m(ud, n-1, false);
        deCas_subdivision_m(ld, n-1, false);
    else
        x = [];
        y = [];
        for i = 1: num_ctrl_points
            point = control_points{i};
            x(i) = point(1);
            y(i) = point(2);
        end
        line(x, y)
    end
end

