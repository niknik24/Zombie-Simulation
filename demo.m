clear all;
close all;
clc;

total_citizens = 150;
simulation_length = 300;
degradation_rate = 0.4;
death_rate = 0.01;
transmission_radius = 75;
zmbPower = [ 0.3 0.8; 0.1 0.6; 0.02 0.5];
% Each citizen has 5 params:
% 4 coords - current location (x,y) and destination (x,y)
% Status code:
% 0 - healthy, 1 - infected lvl.1, 2 - infected lvl.2, 3 - infected
% lvl.3,4 - dead.

citizens = zeros(total_citizens, 5);
citizens(:,1:4) = randi([0, 1000], [total_citizens, 4]);
citizens(1,5) = 1;
citizens(40,5) = 1;
citizens(20,5) = 2;

video = VideoWriter('output');
video.FrameRate = 60;
open(video);
for i = 1:simulation_length
  frame = draw_population(citizens);
  writeVideo(video, frame);
  citizens = update_positions(citizens);
  citizens = update_status(citizens,transmission_radius,zmbPower);
  citizens = update_degradation(citizens, degradation_rate, death_rate);
end
close(video);
sprintf('Survivors: %d', nnz(citizens(citizens(:,5)==0)))
sprintf('Infected lvl.1: %d', nnz(citizens(citizens(:,5)==1)))
sprintf('Infected lvl.2: %d', nnz(citizens(citizens(:,5)==2)))
sprintf('Infected lvl.3: %d', nnz(citizens(citizens(:,5)==3)))
sprintf('Dead: %d', nnz(citizens(citizens(:,5)==4)))
