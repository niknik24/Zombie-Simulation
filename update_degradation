function [new_population] = update_degradation(population, degradation_rate, death_rate)
    infected = find(population(:,5) == 1);
    [k,~] = size(infected);
    for i = 1:k
        if (population(infected(i), 5) == 1 && rand <= death_rate)
            population(infected(i), 5) = 4;
        elseif (population(infected(i), 5) == 2 && rand <= degradation_rate)
            population(infected(i), 5) = 1;
        end
    end
    new_population = population;
end
