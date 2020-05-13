function [result]=run_simulation(total_citizens, simulation_length,...
    transmission_rate, degradation_rate, death_rate,...
    zmbPower, transmission_radius,zmb1,zmb2,zmb3)

% Each citizen has 5 params:
% 4 coords - current location (x,y) and destination (x,y)
% Status code:
% 0 - healthy, 1 - infected lvl.1, 2 - infected lvl.2, 3 - infected
% lvl.3,4 - dead.


citizens = zeros(total_citizens, 5);
citizens(:,1:4) = randi([0, 1000], [total_citizens, 4]);
citizens(1:zmb1,5) = 1;
citizens(40:40+zmb2,5) = 2;
citizens(50:50+zmb3,5) = 3;

% video = VideoWriter('output');
% video.FrameRate = 60;
% open(video);
for i = 1:simulation_length
  draw_population(citizens);
  %writeVideo(video, frame);
  citizens = update_positions(citizens);
  citizens = update_status(citizens, transmission_rate, transmission_radius,zmbPower);
  citizens = update_degradation(citizens, degradation_rate, death_rate);
end
%close(video);
result=[sprintf('Survivors: %d\n', nnz(citizens(citizens(:,5)==0))),...
sprintf('Infected lvl.1: %d\n', nnz(citizens(citizens(:,5)==1))),...
sprintf('Infected lvl.2: %d\n', nnz(citizens(citizens(:,5)==2))),...
sprintf('Infected lvl.3: %d\n', nnz(citizens(citizens(:,5)==3))),...
sprintf('Dead: %d\n', nnz(citizens(citizens(:,5)==4)))];
