function [x,y] = meet_check(p,a,zmbPower)
    check=rand;
    switch p(5)
        case 1
            v=zmbPower(1,:);
        case 2
            v=zmbPower(2,:);
        case 3
            v=zmbPower(3,:);
        case 4
            v=[ 0 0 ];
    end
    if check<v(1)
       x=0;
       y=4;
    elseif check<v(2)
        x=randi(3);
        y=p(5);
    else
        x=4;
        y=p(5);
    end
end
