function [new_population] = update_status(population,transmission_rate, transmission_radius, zmbPower)
    infected = find((population(:,5) ~= 0) & (population(:,5) ~= 4));
    [k,~] = size(infected);
    in_danger = find(population(:,5) == 0) ; 
    [m,~] = size(in_danger);
    for i = 1:k
        p = population(infected(i), :);
        for j = 1:m
            a = population(in_danger(j), :);
            if (norm(p(1:2)-a(1:2)) < transmission_radius)
                [C1, C2]=meet_check(p,a,zmbPower);
                a(5) = C1;
                p(5) = C2;
                population(in_danger(j), :) = a;
                population(infected(i),:) = p;
            end
        end
    end
    new_population = population;
end
